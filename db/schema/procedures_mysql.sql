-- Stored Procedures for Senuhas Colour Mart Database
-- MySQL syntax (converted from Microsoft SQL Server)

-- Procedure 1: Process Inventory Transfer
-- This procedure handles the complete inventory transfer process between stores
DELIMITER $$

CREATE PROCEDURE sp_ProcessInventoryTransfer(
    IN from_store_id_param INT,
    IN to_store_id_param INT,
    IN initiated_by_param INT,
    IN product_id_param INT,
    IN quantity_param INT,
    OUT transfer_id_param INT
)
BEGIN
    DECLARE available_quantity INT;
    DECLARE new_transfer_id INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'An error occurred during inventory transfer';
    END;

    -- Validate input parameters
    IF from_store_id_param = to_store_id_param THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Source and destination stores cannot be the same.';
    END IF;
    
    IF quantity_param <= 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Transfer quantity must be greater than zero.';
    END IF;

    START TRANSACTION;

    -- Check if product exists in source store with sufficient quantity
    SELECT quantity INTO available_quantity
    FROM INVENTORY
    WHERE store_id = from_store_id_param AND product_id = product_id_param
    FOR UPDATE;

    IF available_quantity IS NULL OR available_quantity < quantity_param THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient quantity in source store.';
    END IF;

    -- Deduct quantity from source store
    UPDATE INVENTORY
    SET quantity = quantity - quantity_param
    WHERE store_id = from_store_id_param AND product_id = product_id_param;

    -- Add quantity to destination store (insert if doesn't exist)
    INSERT INTO INVENTORY (store_id, product_id, quantity)
    VALUES (to_store_id_param, product_id_param, quantity_param)
    ON DUPLICATE KEY UPDATE quantity = quantity + VALUES(quantity);

    -- Record transfer in TRANSFER_LOG table
    INSERT INTO TRANSFER_LOG (from_store_id, to_store_id, initiated_by, product_id, quantity, transfer_date)
    VALUES (from_store_id_param, to_store_id_param, initiated_by_param, product_id_param, quantity_param, NOW());

    SET new_transfer_id = LAST_INSERT_ID();
    SET transfer_id_param = new_transfer_id;

    COMMIT;
END$$

DELIMITER ;


-- Procedure 2: Process Sales Transaction
-- This procedure handles the complete sales transaction process
DELIMITER //
CREATE PROCEDURE sp_ProcessSalesTransaction(
    IN store_id_param INT,
    IN customer_id_param INT,
    IN employee_id_param INT,
    IN payment_method_param VARCHAR(20),
    IN product_quantities_param TEXT, -- JSON format in MySQL
    OUT transaction_id_param INT
)
BEGIN
    DECLARE discount_amount_var DECIMAL(12,2) DEFAULT 0;
    DECLARE points_earned INT;
    DECLARE discount_rate_var DECIMAL(5,2);
    DECLARE invoice_number_var VARCHAR(50);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'An error occurred during sales transaction processing';
    END;
    
    -- Validate input parameters
    IF NOT EXISTS (SELECT 1 FROM STORE WHERE store_id = store_id_param) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid store ID.';
    END IF;
    
    IF customer_id_param IS NOT NULL AND NOT EXISTS (SELECT 1 FROM CUSTOMER WHERE customer_id = customer_id_param) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid customer ID.';
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM EMPLOYEE WHERE employee_id = employee_id_param) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid employee ID.';
    END IF;
    
    -- Begin transaction
    START TRANSACTION;
    
    -- Generate invoice number
    SET invoice_number_var = CONCAT('INV-', YEAR(CURDATE()), '-', 
                                   LPAD((SELECT COUNT(*) + 1 FROM SALES_TRANSACTION 
                                         WHERE YEAR(transaction_date) = YEAR(CURDATE())), 4, '0'));
    
    -- Create sales transaction record
    INSERT INTO SALES_TRANSACTION (
        store_id, 
        customer_id, 
        employee_id, 
        transaction_date, 
        subtotal, 
        tax_amount, 
        discount_amount, 
        total_amount, 
        payment_method, 
        invoice_number
    )
    VALUES (
        store_id_param, 
        customer_id_param, 
        employee_id_param, 
        NOW(), 
        0, -- Will be updated later
        0, -- Will be updated later
        0, -- Will be updated later
        0, -- Will be updated later
        payment_method_param, 
        invoice_number_var
    );
    
    -- Get the new transaction_id
    SET transaction_id_param = LAST_INSERT_ID();
    
    -- Process product quantities from JSON
    -- Note: This is a simplified version. In a real implementation, you would parse the JSON properly
    -- For each product in the JSON, insert sales detail and update inventory
    
    -- For demonstration purposes, we'll assume the JSON is processed and sales details are inserted
    -- In a real implementation, you would use JSON_TABLE or other JSON functions to parse the input
    
    -- Calculate discount amount (if customer is wholesale)
    IF customer_id_param IS NOT NULL AND EXISTS (SELECT 1 FROM WHOLESALE_CUSTOMER WHERE customer_id = customer_id_param) THEN
        SELECT discount_rate INTO discount_rate_var
        FROM WHOLESALE_CUSTOMER
        WHERE customer_id = customer_id_param;
        
        -- Calculate discount based on subtotal (simplified)
        SELECT SUM(quantity * unit_price * (discount / 100)) INTO discount_amount_var
        FROM SALES_DETAIL
        WHERE transaction_id = transaction_id_param;
        
        -- Update discount amount in transaction
        UPDATE SALES_TRANSACTION
        SET discount_amount = discount_amount_var
        WHERE transaction_id = transaction_id_param;
    END IF;
    
    -- Update transaction totals
    UPDATE SALES_TRANSACTION st
    SET subtotal = (
            SELECT IFNULL(SUM((quantity * unit_price) * (1 - discount/100)), 0)
            FROM SALES_DETAIL
            WHERE transaction_id = st.transaction_id
        ),
        tax_amount = (
            SELECT IFNULL(SUM((quantity * unit_price) * (1 - discount/100)), 0) * 0.12
            FROM SALES_DETAIL
            WHERE transaction_id = st.transaction_id
        ),
        total_amount = (
            SELECT (IFNULL(SUM((quantity * unit_price) * (1 - discount/100)), 0) * 1.12) - discount_amount_var
            FROM SALES_DETAIL
            WHERE transaction_id = st.transaction_id
        )
    WHERE transaction_id = transaction_id_param;
    
    -- Update loyalty points if retail customer
    IF customer_id_param IS NOT NULL AND EXISTS (SELECT 1 FROM RETAIL_CUSTOMER WHERE customer_id = customer_id_param) THEN
        -- Calculate points (1 point per 100 currency units spent)
        SELECT FLOOR(total_amount / 100) INTO points_earned
        FROM SALES_TRANSACTION
        WHERE transaction_id = transaction_id_param;
        
        -- Update customer loyalty points
        UPDATE CUSTOMER
        SET loyalty_points = loyalty_points + points_earned
        WHERE customer_id = customer_id_param;
    END IF;
    
    -- Create payment record
    INSERT INTO PAYMENT (
        transaction_id,
        payment_date,
        amount,
        payment_method,
        payment_status,
        reference_number
    )
    VALUES (
        transaction_id_param,
        NOW(),
        (SELECT total_amount FROM SALES_TRANSACTION WHERE transaction_id = transaction_id_param),
        payment_method_param,
        'Completed',
        CASE 
            WHEN payment_method_param = 'Cash' THEN NULL
            ELSE CONCAT('REF-', transaction_id_param, '-', FLOOR(RAND() * 10000))
        END
    );
    
    -- Commit transaction
    COMMIT;
END//
DELIMITER ;

-- Procedure 3: Generate Sales Report
-- This procedure generates a sales report for a specific period
DELIMITER //
CREATE PROCEDURE sp_GenerateSalesReport(
    IN start_date_param DATETIME,
    IN end_date_param DATETIME,
    IN store_id_param INT,
    IN category_id_param INT
)
BEGIN
    -- Validate date range
    IF start_date_param > end_date_param THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Start date cannot be later than end date.';
    END IF;
    
    -- Validate store_id if provided
    IF store_id_param IS NOT NULL AND NOT EXISTS (SELECT 1 FROM STORE WHERE store_id = store_id_param) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid store ID.';
    END IF;
    
    -- Validate category_id if provided
    IF category_id_param IS NOT NULL AND NOT EXISTS (SELECT 1 FROM PRODUCT_CATEGORY WHERE category_id = category_id_param) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid category ID.';
    END IF;
    
    -- Generate sales summary by store
    SELECT 
        s.store_id,
        s.store_name,
        s.city,
        COUNT(DISTINCT st.transaction_id) AS transaction_count,
        SUM(st.subtotal) AS total_subtotal,
        SUM(st.tax_amount) AS total_tax,
        SUM(st.discount_amount) AS total_discounts,
        SUM(st.total_amount) AS total_sales
    FROM SALES_TRANSACTION st
    JOIN STORE s ON st.store_id = s.store_id
    WHERE st.transaction_date BETWEEN start_date_param AND end_date_param
    AND (store_id_param IS NULL OR st.store_id = store_id_param)
    GROUP BY s.store_id, s.store_name, s.city
    ORDER BY total_sales DESC;
    
    -- Generate sales summary by product category
    SELECT 
        pc.category_id,
        pc.category_name,
        COUNT(DISTINCT sd.sales_detail_id) AS sales_count,
        SUM(sd.quantity) AS total_quantity,
        SUM(sd.quantity * sd.unit_price * (1 - sd.discount/100)) AS total_sales
    FROM SALES_DETAIL sd
    JOIN SALES_TRANSACTION st ON sd.transaction_id = st.transaction_id
    JOIN PRODUCT p ON sd.product_id = p.product_id
    JOIN PRODUCT_CATEGORY pc ON p.category_id = pc.category_id
    WHERE st.transaction_date BETWEEN start_date_param AND end_date_param
    AND (store_id_param IS NULL OR st.store_id = store_id_param)
    AND (category_id_param IS NULL OR p.category_id = category_id_param OR pc.parent_category_id = category_id_param)
    GROUP BY pc.category_id, pc.category_name
    ORDER BY total_sales DESC;
    
    -- Generate top selling products
    SELECT 
        p.product_id,
        p.product_name,
        pc.category_name,
        SUM(sd.quantity) AS total_quantity,
        SUM(sd.quantity * sd.unit_price * (1 - sd.discount/100)) AS total_sales
    FROM SALES_DETAIL sd
    JOIN SALES_TRANSACTION st ON sd.transaction_id = st.transaction_id
    JOIN PRODUCT p ON sd.product_id = p.product_id
    JOIN PRODUCT_CATEGORY pc ON p.category_id = pc.category_id
    WHERE st.transaction_date BETWEEN start_date_param AND end_date_param
    AND (store_id_param IS NULL OR st.store_id = store_id_param)
    AND (category_id_param IS NULL OR p.category_id = category_id_param OR pc.parent_category_id = category_id_param)
    GROUP BY p.product_id, p.product_name, pc.category_name
    ORDER BY total_quantity DESC
    LIMIT 10;
    
    -- Generate sales by payment method
    SELECT 
        st.payment_method,
        COUNT(DISTINCT st.transaction_id) AS transaction_count,
        SUM(st.total_amount) AS total_sales
    FROM SALES_TRANSACTION st
    WHERE st.transaction_date BETWEEN start_date_param AND end_date_param
    AND (store_id_param IS NULL OR st.store_id = store_id_param)
    GROUP BY st.payment_method
    ORDER BY total_sales DESC;
END//
DELIMITER ;

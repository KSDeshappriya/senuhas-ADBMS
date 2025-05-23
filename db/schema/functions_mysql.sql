-- User-Defined Functions for Senuhas Colour Mart Database
-- MySQL syntax (converted from Microsoft SQL Server)

-- Function 1: Calculate total sales for a specific store within a date range
-- This function returns the total sales amount for a given store within a specified date range
DELIMITER //
CREATE FUNCTION fn_GetStoreSalesInPeriod(
    store_id_param INT,
    start_date_param DATETIME,
    end_date_param DATETIME
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE total_sales DECIMAL(12,2);
    
    SELECT IFNULL(SUM(total_amount), 0) INTO total_sales
    FROM SALES_TRANSACTION
    WHERE store_id = store_id_param
    AND transaction_date >= start_date_param
    AND transaction_date <= end_date_param;
    
    RETURN total_sales;
END//
DELIMITER ;

-- Function 2: Get product inventory across all stores
-- In MySQL, we'll use a stored procedure instead of a table-valued function
DELIMITER //
CREATE PROCEDURE sp_GetProductInventoryAcrossStores(
    IN product_id_param INT
)
BEGIN
    SELECT 
        s.store_id,
        s.store_name,
        s.city,
        p.product_id,
        p.product_name,
        i.quantity,
        i.shelf_location,
        i.last_updated,
        i.expiry_date
    FROM INVENTORY i
    JOIN STORE s ON i.store_id = s.store_id
    JOIN PRODUCT p ON i.product_id = p.product_id
    WHERE p.product_id = product_id_param;
END//
DELIMITER ;

-- Function 3: Calculate employee commission
-- This function calculates the commission amount for a sales staff member based on their sales in a given period
DELIMITER //
CREATE FUNCTION fn_CalculateEmployeeCommission(
    employee_id_param INT,
    start_date_param DATETIME,
    end_date_param DATETIME
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE commission_amount DECIMAL(12,2);
    DECLARE commission_rate DECIMAL(5,2);
    DECLARE total_sales DECIMAL(12,2);
    
    -- Get the employee's commission rate
    SELECT commission_rate INTO commission_rate
    FROM SALES_STAFF
    WHERE employee_id = employee_id_param;
    
    -- If employee is not a sales staff or doesn't exist, return 0
    IF commission_rate IS NULL THEN
        RETURN 0;
    END IF;
    
    -- Calculate total sales made by the employee in the given period
    SELECT IFNULL(SUM(total_amount), 0) INTO total_sales
    FROM SALES_TRANSACTION
    WHERE employee_id = employee_id_param
    AND transaction_date >= start_date_param
    AND transaction_date <= end_date_param;
    
    -- Calculate commission amount
    SET commission_amount = total_sales * (commission_rate / 100);
    
    RETURN commission_amount;
END//
DELIMITER ;

-- Function 4: Get customer purchase history
-- In MySQL, we'll use a stored procedure instead of a table-valued function
DELIMITER //
CREATE PROCEDURE sp_GetCustomerPurchaseHistory(
    IN customer_id_param INT
)
BEGIN
    SELECT 
        st.transaction_id,
        st.transaction_date,
        s.store_name,
        p.product_id,
        p.product_name,
        sd.quantity,
        sd.unit_price,
        sd.discount,
        (sd.quantity * sd.unit_price * (1 - sd.discount/100)) AS line_total
    FROM SALES_TRANSACTION st
    JOIN SALES_DETAIL sd ON st.transaction_id = sd.transaction_id
    JOIN STORE s ON st.store_id = s.store_id
    JOIN PRODUCT p ON sd.product_id = p.product_id
    WHERE st.customer_id = customer_id_param
    ORDER BY st.transaction_date DESC;
END//
DELIMITER ;

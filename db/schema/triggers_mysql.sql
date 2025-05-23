-- Triggers for Senuhas Colour Mart Database
-- MySQL syntax (converted from Microsoft SQL Server)

-- Trigger 1: Update inventory quantity after sales transaction
-- This trigger automatically reduces inventory quantity when a sales detail is inserted
DELIMITER //
CREATE TRIGGER trg_UpdateInventoryAfterSale
AFTER INSERT ON SALES_DETAIL
FOR EACH ROW
BEGIN
    DECLARE store_id_var INT;
    DECLARE current_quantity INT;
    DECLARE reorder_level INT;
    DECLARE product_name VARCHAR(100);
    
    -- Get the store_id from the sales transaction
    SELECT st.store_id INTO store_id_var
    FROM SALES_TRANSACTION st
    WHERE st.transaction_id = NEW.transaction_id;
    
    -- Update the inventory
    UPDATE INVENTORY
    SET quantity = quantity - NEW.quantity,
        last_updated = CURDATE()
    WHERE product_id = NEW.product_id
    AND store_id = store_id_var;
    
    -- Check if inventory is below reorder level and log if needed
    SELECT i.quantity, p.reorder_level, p.product_name 
    INTO current_quantity, reorder_level, product_name
    FROM INVENTORY i
    JOIN PRODUCT p ON i.product_id = p.product_id
    WHERE i.product_id = NEW.product_id
    AND i.store_id = store_id_var;
    
    IF current_quantity <= reorder_level THEN
        -- In a real system, this would insert into a reorder log table or notification system
        -- For MySQL, we can use a signal or insert into a log table
        INSERT INTO reorder_log (product_id, store_id, current_quantity, reorder_level, log_date)
        VALUES (NEW.product_id, store_id_var, current_quantity, reorder_level, NOW());
    END IF;
END//
DELIMITER ;

-- Create reorder_log table for the trigger
CREATE TABLE reorder_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    current_quantity INT NOT NULL,
    reorder_level INT NOT NULL,
    log_date DATETIME NOT NULL,
    CONSTRAINT FK_REORDER_LOG_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    CONSTRAINT FK_REORDER_LOG_STORE FOREIGN KEY (store_id) REFERENCES STORE(store_id)
);

-- Trigger 2: Update total amount in purchase order when detail is added or modified
-- This trigger automatically calculates and updates the total amount of a purchase order
-- when purchase order details are inserted, updated, or deleted
DELIMITER //
CREATE TRIGGER trg_UpdatePurchaseOrderTotal_Insert
AFTER INSERT ON PO_DETAIL
FOR EACH ROW
BEGIN
    UPDATE PURCHASE_ORDER po
    SET total_amount = (
        SELECT SUM(quantity * unit_price)
        FROM PO_DETAIL
        WHERE po_id = po.po_id
    )
    WHERE po.po_id = NEW.po_id;
END//

CREATE TRIGGER trg_UpdatePurchaseOrderTotal_Update
AFTER UPDATE ON PO_DETAIL
FOR EACH ROW
BEGIN
    UPDATE PURCHASE_ORDER po
    SET total_amount = (
        SELECT SUM(quantity * unit_price)
        FROM PO_DETAIL
        WHERE po_id = po.po_id
    )
    WHERE po.po_id = NEW.po_id;
END//

CREATE TRIGGER trg_UpdatePurchaseOrderTotal_Delete
AFTER DELETE ON PO_DETAIL
FOR EACH ROW
BEGIN
    UPDATE PURCHASE_ORDER po
    SET total_amount = (
        SELECT IFNULL(SUM(quantity * unit_price), 0)
        FROM PO_DETAIL
        WHERE po_id = po.po_id
    )
    WHERE po.po_id = OLD.po_id;
END//
DELIMITER ;

-- Trigger 3: Prevent deletion of products with inventory
-- This trigger prevents deletion of products that still have inventory
DELIMITER //
CREATE TRIGGER trg_PreventProductDeletion
BEFORE DELETE ON PRODUCT
FOR EACH ROW
BEGIN
    DECLARE inventory_count INT;
    
    -- Check if the product being deleted has inventory
    SELECT COUNT(*) INTO inventory_count
    FROM INVENTORY
    WHERE product_id = OLD.product_id
    AND quantity > 0;
    
    IF inventory_count > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot delete products that still have inventory. Update product status to "Discontinued" instead.';
    END IF;
END//
DELIMITER ;

-- Trigger 4: Automatically update sales transaction totals
-- This trigger automatically calculates and updates the subtotal, tax amount, and total amount
-- of a sales transaction when sales details are inserted, updated, or deleted
DELIMITER //
CREATE TRIGGER trg_UpdateSalesTransactionTotals_Insert
AFTER INSERT ON SALES_DETAIL
FOR EACH ROW
BEGIN
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
            SELECT (IFNULL(SUM((quantity * unit_price) * (1 - discount/100)), 0) * 1.12) - st.discount_amount
            FROM SALES_DETAIL
            WHERE transaction_id = st.transaction_id
        )
    WHERE transaction_id = NEW.transaction_id;
END//

CREATE TRIGGER trg_UpdateSalesTransactionTotals_Update
AFTER UPDATE ON SALES_DETAIL
FOR EACH ROW
BEGIN
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
            SELECT (IFNULL(SUM((quantity * unit_price) * (1 - discount/100)), 0) * 1.12) - st.discount_amount
            FROM SALES_DETAIL
            WHERE transaction_id = st.transaction_id
        )
    WHERE transaction_id = NEW.transaction_id;
END//

CREATE TRIGGER trg_UpdateSalesTransactionTotals_Delete
AFTER DELETE ON SALES_DETAIL
FOR EACH ROW
BEGIN
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
            SELECT (IFNULL(SUM((quantity * unit_price) * (1 - discount/100)), 0) * 1.12) - st.discount_amount
            FROM SALES_DETAIL
            WHERE transaction_id = st.transaction_id
        )
    WHERE transaction_id = OLD.transaction_id;
END//
DELIMITER ;

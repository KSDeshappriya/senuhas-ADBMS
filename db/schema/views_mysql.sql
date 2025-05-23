-- Database Views for Senuhas Colour Mart Database
-- MySQL syntax (converted from Microsoft SQL Server)

-- View 1: Sales Summary by Store and Month
-- This view provides a monthly sales summary for each store
CREATE VIEW vw_StoreMonthlySalesSummary AS
SELECT 
    s.store_id,
    s.store_name,
    s.city,
    YEAR(st.transaction_date) AS sales_year,
    MONTH(st.transaction_date) AS sales_month,
    COUNT(st.transaction_id) AS transaction_count,
    SUM(st.subtotal) AS total_subtotal,
    SUM(st.tax_amount) AS total_tax,
    SUM(st.discount_amount) AS total_discounts,
    SUM(st.total_amount) AS total_sales
FROM STORE s
JOIN SALES_TRANSACTION st ON s.store_id = st.store_id
GROUP BY 
    s.store_id,
    s.store_name,
    s.city,
    YEAR(st.transaction_date),
    MONTH(st.transaction_date);

-- View 2: Current Inventory Status
-- This view provides the current inventory status for all products across all stores
CREATE VIEW vw_CurrentInventoryStatus AS
SELECT 
    s.store_id,
    s.store_name,
    p.product_id,
    p.product_name,
    p.description,
    pc.category_name,
    i.quantity,
    p.unit_price,
    (i.quantity * p.unit_price) AS inventory_value,
    p.reorder_level,
    CASE 
        WHEN i.quantity <= p.reorder_level THEN 'Reorder Required'
        WHEN i.quantity <= (p.reorder_level * 1.5) THEN 'Low Stock'
        ELSE 'Adequate Stock'
    END AS stock_status,
    i.last_updated,
    i.shelf_location,
    i.expiry_date
FROM INVENTORY i
JOIN STORE s ON i.store_id = s.store_id
JOIN PRODUCT p ON i.product_id = p.product_id
JOIN PRODUCT_CATEGORY pc ON p.category_id = pc.category_id;

-- View 3: Customer Purchase Summary
-- This view provides a summary of purchases for each customer
CREATE VIEW vw_CustomerPurchaseSummary AS
SELECT 
    c.customer_id,
    CONCAT(p.first_name, ' ', p.last_name) AS customer_name,
    c.customer_type,
    COUNT(st.transaction_id) AS total_transactions,
    SUM(st.total_amount) AS total_spent,
    AVG(st.total_amount) AS average_transaction_value,
    MIN(st.transaction_date) AS first_purchase_date,
    MAX(st.transaction_date) AS last_purchase_date,
    DATEDIFF(MAX(st.transaction_date), MIN(st.transaction_date)) / 
        CASE WHEN COUNT(st.transaction_id) - 1 <= 0 THEN 1 
             ELSE COUNT(st.transaction_id) - 1 END AS avg_days_between_purchases,
    c.loyalty_points
FROM CUSTOMER c
JOIN PERSON p ON c.person_id = p.person_id
LEFT JOIN SALES_TRANSACTION st ON c.customer_id = st.customer_id
GROUP BY 
    c.customer_id,
    CONCAT(p.first_name, ' ', p.last_name),
    c.customer_type,
    c.loyalty_points;

-- View 4: Product Sales Performance
-- This view provides sales performance metrics for each product
CREATE VIEW vw_ProductSalesPerformance AS
SELECT 
    p.product_id,
    p.product_name,
    pc.category_name,
    COUNT(sd.sales_detail_id) AS times_sold,
    SUM(sd.quantity) AS total_quantity_sold,
    SUM(sd.quantity * sd.unit_price * (1 - sd.discount/100)) AS total_revenue,
    AVG(sd.unit_price) AS average_selling_price,
    AVG(sd.discount) AS average_discount_percentage,
    MIN(st.transaction_date) AS first_sale_date,
    MAX(st.transaction_date) AS last_sale_date
FROM PRODUCT p
JOIN PRODUCT_CATEGORY pc ON p.category_id = pc.category_id
LEFT JOIN SALES_DETAIL sd ON p.product_id = sd.product_id
LEFT JOIN SALES_TRANSACTION st ON sd.transaction_id = st.transaction_id
GROUP BY 
    p.product_id,
    p.product_name,
    pc.category_name;

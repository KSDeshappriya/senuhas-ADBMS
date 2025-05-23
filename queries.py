# senuhas_dashboard/queries.py

# --- Dashboard Queries ---
TOTAL_SALES = "SELECT SUM(total_amount) AS total_sales FROM SALES_TRANSACTION;"
TOTAL_TRANSACTIONS = "SELECT COUNT(transaction_id) AS total_transactions FROM SALES_TRANSACTION;"
TOTAL_CUSTOMERS = "SELECT COUNT(customer_id) AS total_customers FROM CUSTOMER;"
RECENT_TRANSACTIONS = """
    SELECT st.transaction_id, st.transaction_date, c.customer_id, 
           CONCAT(p.first_name, ' ', p.last_name) AS customer_name, 
           s.store_name, st.total_amount
    FROM SALES_TRANSACTION st
    LEFT JOIN CUSTOMER c ON st.customer_id = c.customer_id
    LEFT JOIN PERSON p ON c.person_id = p.person_id
    JOIN STORE s ON st.store_id = s.store_id
    ORDER BY st.transaction_date DESC
    LIMIT 10;
"""

# --- Sales Trends Queries ---
SALES_OVER_TIME = """
    SELECT 
        DATE_FORMAT(transaction_date, '%Y-%m') AS sales_month,
        SUM(total_amount) AS monthly_sales
    FROM SALES_TRANSACTION
    WHERE transaction_date BETWEEN %(start_date)s AND %(end_date)s
    GROUP BY sales_month
    ORDER BY sales_month;
"""

SALES_BY_CATEGORY = """
    SELECT 
        pc.category_name,
        SUM(sd.quantity * sd.unit_price * (1 - sd.discount/100)) AS total_sales
    FROM SALES_DETAIL sd
    JOIN PRODUCT p ON sd.product_id = p.product_id
    JOIN PRODUCT_CATEGORY pc ON p.category_id = pc.category_id
    JOIN SALES_TRANSACTION st ON sd.transaction_id = st.transaction_id
    WHERE st.transaction_date BETWEEN %(start_date)s AND %(end_date)s
    GROUP BY pc.category_name
    ORDER BY total_sales DESC;
"""

SALES_BY_STORE = """
    SELECT 
        s.store_name,
        SUM(st.total_amount) AS total_sales
    FROM SALES_TRANSACTION st
    JOIN STORE s ON st.store_id = s.store_id
    WHERE st.transaction_date BETWEEN %(start_date)s AND %(end_date)s
    GROUP BY s.store_name
    ORDER BY total_sales DESC;
"""

TOP_SELLING_PRODUCTS = """
    SELECT 
        pr.product_name,
        SUM(sd.quantity) AS total_quantity_sold,
        SUM(sd.quantity * sd.unit_price * (1 - sd.discount/100)) AS total_revenue
    FROM SALES_DETAIL sd
    JOIN PRODUCT pr ON sd.product_id = pr.product_id
    JOIN SALES_TRANSACTION st ON sd.transaction_id = st.transaction_id
    WHERE st.transaction_date BETWEEN %(start_date)s AND %(end_date)s
    GROUP BY pr.product_name
    ORDER BY total_revenue DESC
    LIMIT 10;
"""

# --- Basic Forecasting ---
HISTORICAL_MONTHLY_SALES = """
    SELECT 
        DATE_FORMAT(transaction_date, '%Y-%m-01') AS month_start_date, -- For proper datetime conversion
        SUM(total_amount) AS monthly_sales
    FROM SALES_TRANSACTION
    GROUP BY month_start_date
    ORDER BY month_start_date;
"""

# --- Database Explorer ---
GET_TABLE_SCHEMA = "DESCRIBE {};" # Placeholder for table name
GET_TABLE_DATA = "SELECT * FROM {} LIMIT 100;" # Placeholder for table name
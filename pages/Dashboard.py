# senuhas_dashboard/pages/01_📊_Dashboard.py
import streamlit as st
import pandas as pd
import plotly.express as px
from database import fetch_data, get_connection
import queries # Import your queries module

st.set_page_config(page_title="Dashboard", page_icon="📊", layout="wide")
st.title("📊 Dashboard Overview")

conn = get_connection()

if conn:
    # --- Key Metrics ---
    st.subheader("Key Performance Indicators")
    col1, col2, col3 = st.columns(3)

    total_sales_df = fetch_data(conn, queries.TOTAL_SALES)
    total_sales = total_sales_df['total_sales'].iloc[0] if not total_sales_df.empty else 0
    col1.metric("Total Sales", f"LKR {total_sales:,.2f}")

    total_transactions_df = fetch_data(conn, queries.TOTAL_TRANSACTIONS)
    total_transactions = total_transactions_df['total_transactions'].iloc[0] if not total_transactions_df.empty else 0
    col2.metric("Total Transactions", f"{total_transactions:,}")

    total_customers_df = fetch_data(conn, queries.TOTAL_CUSTOMERS)
    total_customers = total_customers_df['total_customers'].iloc[0] if not total_customers_df.empty else 0
    col3.metric("Total Customers", f"{total_customers:,}")

    st.markdown("---")

    # --- Recent Transactions ---
    st.subheader("Recent Transactions")
    recent_transactions_df = fetch_data(conn, queries.RECENT_TRANSACTIONS)
    if not recent_transactions_df.empty:
        st.dataframe(recent_transactions_df, use_container_width=True)
    else:
        st.info("No recent transactions found or error fetching data.")
    
    st.markdown("---")

    # --- Sales Over Time (Last 12 Months for Dashboard) ---
    st.subheader("Monthly Sales Trend (Last 12 Full Months)")
    sales_over_time_query = """
        SELECT 
            DATE_FORMAT(transaction_date, '%Y-%m') AS sales_month,
            SUM(total_amount) AS monthly_sales
        FROM SALES_TRANSACTION
        WHERE transaction_date >= DATE_SUB(LAST_DAY(CURDATE() - INTERVAL 1 MONTH), INTERVAL 11 MONTH) 
          AND transaction_date < LAST_DAY(CURDATE() - INTERVAL 1 MONTH) + INTERVAL 1 DAY
        GROUP BY sales_month
        ORDER BY sales_month;
    """ # Query for last 12 full months
    sales_over_time_df = fetch_data(conn, sales_over_time_query)

    if not sales_over_time_df.empty:
        sales_over_time_df['sales_month'] = pd.to_datetime(sales_over_time_df['sales_month'])
        fig = px.line(sales_over_time_df, x='sales_month', y='monthly_sales', 
                      title="Monthly Sales", markers=True,
                      labels={'sales_month': 'Month', 'monthly_sales': 'Total Sales (LKR)'})
        fig.update_layout(xaxis_title="Month", yaxis_title="Total Sales (LKR)")
        st.plotly_chart(fig, use_container_width=True)
    else:
        st.info("No sales data found for the last 12 months or error fetching data.")

else:
    st.error("Database connection failed. Please check your configuration.")
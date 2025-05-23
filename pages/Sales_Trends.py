# senuhas_dashboard/pages/02_📈_Sales_Trends.py
import streamlit as st
import pandas as pd
import plotly.express as px
from database import fetch_data, get_connection
import queries
from datetime import datetime, timedelta

st.set_page_config(page_title="Sales Trends", page_icon="📈", layout="wide")
st.title("📈 Sales Trend Analysis")

conn = get_connection()

if conn:
    st.sidebar.header("Date Range Filter")
    
    # Default to last 1 year
    default_end_date = datetime.now().date()
    default_start_date = default_end_date - timedelta(days=365)

    # Fetch min and max transaction dates for date input defaults
    min_max_date_query = "SELECT MIN(transaction_date) as min_date, MAX(transaction_date) as max_date FROM SALES_TRANSACTION"
    min_max_df = fetch_data(conn, min_max_date_query)
    
    db_min_date = pd.to_datetime(min_max_df['min_date'].iloc[0]).date() if not min_max_df.empty and min_max_df['min_date'].iloc[0] else default_start_date
    db_max_date = pd.to_datetime(min_max_df['max_date'].iloc[0]).date() if not min_max_df.empty and min_max_df['max_date'].iloc[0] else default_end_date

    start_date = st.sidebar.date_input("Start Date", value=db_min_date, min_value=db_min_date, max_value=db_max_date)
    end_date = st.sidebar.date_input("End Date", value=db_max_date, min_value=db_min_date, max_value=db_max_date)

    if start_date > end_date:
        st.sidebar.error("Error: Start date must be before end date.")
    else:
        # Convert to datetime for query compatibility if needed (depends on DB date format)
        # For MariaDB/MySQL, string 'YYYY-MM-DD' is usually fine for BETWEEN
        query_params = {'start_date': str(start_date), 'end_date': str(end_date)}

        # --- Sales Over Time ---
        st.subheader("Sales Over Time")
        sales_over_time_df = fetch_data(conn, queries.SALES_OVER_TIME, query_params)
        if not sales_over_time_df.empty:
            sales_over_time_df['sales_month'] = pd.to_datetime(sales_over_time_df['sales_month'])
            fig_time = px.line(sales_over_time_df, x='sales_month', y='monthly_sales', title="Sales Trend", markers=True)
            fig_time.update_layout(xaxis_title="Month", yaxis_title="Total Sales (LKR)")
            st.plotly_chart(fig_time, use_container_width=True)
        else:
            st.info(f"No sales data found for the selected period: {start_date} to {end_date}")
        
        st.markdown("---")

        col1, col2 = st.columns(2)

        with col1:
            # --- Sales by Category ---
            st.subheader("Sales by Product Category")
            sales_by_category_df = fetch_data(conn, queries.SALES_BY_CATEGORY, query_params)
            if not sales_by_category_df.empty:
                fig_cat = px.bar(sales_by_category_df, x='category_name', y='total_sales', 
                                 title="Sales by Category", color='category_name')
                fig_cat.update_layout(xaxis_title="Product Category", yaxis_title="Total Sales (LKR)")
                st.plotly_chart(fig_cat, use_container_width=True)
            else:
                st.info(f"No sales data by category found for the selected period.")

        with col2:
            # --- Sales by Store ---
            st.subheader("Sales by Store")
            sales_by_store_df = fetch_data(conn, queries.SALES_BY_STORE, query_params)
            if not sales_by_store_df.empty:
                fig_store = px.pie(sales_by_store_df, names='store_name', values='total_sales', title="Sales Distribution by Store")
                st.plotly_chart(fig_store, use_container_width=True)
            else:
                st.info(f"No sales data by store found for the selected period.")

        st.markdown("---")
        # --- Top Selling Products ---
        st.subheader("Top Selling Products")
        top_products_df = fetch_data(conn, queries.TOP_SELLING_PRODUCTS, query_params)
        if not top_products_df.empty:
            st.dataframe(top_products_df, use_container_width=True)
        else:
            st.info(f"No top selling products found for the selected period.")
else:
    st.error("Database connection failed. Please check your configuration.")
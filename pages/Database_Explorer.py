# senuhas_dashboard/pages/04_🛠️_Database_Explorer.py
import streamlit as st
import pandas as pd
from database import fetch_data, get_connection, get_table_names, execute_query
import queries # Not strictly needed here unless you predefine explorer queries

st.set_page_config(page_title="Database Explorer", page_icon="🛠️", layout="wide")
st.title("🛠️ Database Explorer")

conn = get_connection()

if conn:
    st.subheader("Browse Tables")
    table_names = get_table_names(conn)
    
    if table_names:
        selected_table = st.selectbox("Select a table to view:", table_names)

        if selected_table:
            # Display Table Schema
            st.markdown(f"**Schema for `{selected_table}`:**")
            try:
                # Ensure selected_table is safe (it comes from SHOW TABLES, so it should be)
                # However, for general user input, always sanitize.
                schema_df = fetch_data(conn, queries.GET_TABLE_SCHEMA.format(selected_table)) # Use .format for table names
                if not schema_df.empty:
                    st.dataframe(schema_df, use_container_width=True)
                else:
                    st.warning(f"Could not retrieve schema for {selected_table}.")
            except Exception as e:
                st.error(f"Error fetching schema: {e}")


            # Display Table Data (with limit)
            st.markdown(f"**Data from `{selected_table}` (first 100 rows):**")
            try:
                # Ensure selected_table is safe
                data_df = fetch_data(conn, queries.GET_TABLE_DATA.format(selected_table))
                if not data_df.empty:
                    st.dataframe(data_df, use_container_width=True)
                else:
                    st.info(f"No data found in {selected_table} or table is empty.")
            except Exception as e:
                st.error(f"Error fetching data: {e}")
    else:
        st.info("No tables found in the database or error fetching table list.")

    st.markdown("---")
    st.subheader("Custom SQL Query")
    custom_query = st.text_area("Enter your SQL query:", height=150, 
                                placeholder="e.g., SELECT * FROM CUSTOMER WHERE customer_type = 'Retail' LIMIT 10;")
    
    if st.button("Run Query"):
        if custom_query:
            with st.spinner("Executing query..."):
                # Basic check for query type (very naive)
                query_lower = custom_query.strip().lower()
                if query_lower.startswith("select") or query_lower.startswith("show") or query_lower.startswith("describe"):
                    result_df = fetch_data(conn, custom_query)
                    if not result_df.empty:
                        st.success("Query executed successfully!")
                        st.dataframe(result_df, use_container_width=True)
                    elif result_df is not None: # Empty dataframe means query ran but no results
                         st.info("Query executed, but no results returned.")
                    # else: error already handled in fetch_data
                elif any(keyword in query_lower for keyword in ["insert", "update", "delete", "create", "drop", "alter"]):
                    # For simplicity, allowing DML/DDL. In a real prod app, be very careful.
                    st.warning("Executing a data modification or schema change query. Use with caution!")
                    if execute_query(conn, custom_query):
                        st.success("Modification query executed successfully!")
                    # else: error handled in execute_query
                else:
                    st.error("Unsupported query type or potentially unsafe query. Only SELECT, SHOW, DESCRIBE, INSERT, UPDATE, DELETE are processed here for safety.")
        else:
            st.warning("Please enter a SQL query.")
else:
    st.error("Database connection failed. Please check your configuration.")
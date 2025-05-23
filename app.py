# senuhas_dashboard/app.py
import streamlit as st

st.set_page_config(
    page_title="Senuhas DB Management",
    page_icon="🛍️",
    layout="wide"
)

st.title("🛍️ Senuhas Database Management System")

st.sidebar.success("Select a page above.")

st.markdown(
    """
    Welcome to the Senuhas Database Management application!
    
    This system allows you to explore and analyze data from the Senuhas stores.
    
    **👈 Select a section from the sidebar** to get started:
    - **Dashboard:** Get a quick overview of key metrics.
    - **Sales Trends:** Analyze sales patterns by category, store, and over time.
    - **Basic Forecasting:** View simple sales projections.
    - **Database Explorer:** Browse tables and run custom SQL queries.
    
    ---
    *Developed with Streamlit*
    """
)

st.info("Please ensure your MySQL database `senuhas_db` is running and accessible.", icon="ℹ️")

# You can add a check here to see if the database connection is working
from database import get_connection
conn = get_connection()
if conn:
    if conn.is_connected():
        st.sidebar.success("Successfully connected to Database!")
        # conn.close() # Close if only checking, or keep open if pages will use it immediately.
                       # With st.cache_resource, Streamlit manages this.
    else:
        st.sidebar.error("Failed to connect to Database.")
else:
    st.sidebar.error("Database connection object is None.")
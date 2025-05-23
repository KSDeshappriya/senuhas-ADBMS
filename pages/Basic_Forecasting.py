# senuhas_dashboard/pages/03_🔮_Basic_Forecasting.py
import streamlit as st
import pandas as pd
import numpy as np
import plotly.express as px
from database import fetch_data, get_connection
import queries
from datetime import datetime
from dateutil.relativedelta import relativedelta


st.set_page_config(page_title="Basic Forecasting", page_icon="🔮", layout="wide")
st.title("🔮 Basic Sales Forecasting")
st.info("""
    **Disclaimer:** This is a very basic forecasting model. 
    It uses a simple moving average or a simple linear trend for projections. 
    For accurate forecasting, more sophisticated time series models (e.g., ARIMA, Prophet) are recommended.
    This page primarily demonstrates retrieving historical data and making a naive projection.
    """)

conn = get_connection()

if conn:
    historical_sales_df = fetch_data(conn, queries.HISTORICAL_MONTHLY_SALES)

    if not historical_sales_df.empty:
        historical_sales_df['month_start_date'] = pd.to_datetime(historical_sales_df['month_start_date'])
        historical_sales_df = historical_sales_df.sort_values('month_start_date')
        
        st.subheader("Historical Monthly Sales")
        fig_hist = px.line(historical_sales_df, x='month_start_date', y='monthly_sales', 
                           title="Historical Monthly Sales Data", markers=True,
                           labels={'month_start_date': 'Month', 'monthly_sales': 'Total Sales (LKR)'})
        st.plotly_chart(fig_hist, use_container_width=True)

        st.markdown("---")
        st.subheader("Simple Forecast Projection")

        forecast_months = st.slider("Number of months to forecast:", 1, 12, 6)
        
        # Ensure there's data to forecast from
        if len(historical_sales_df) < 2:
            st.warning("Not enough historical data to perform a forecast (need at least 2 months).")
        else:
            # Simple Linear Trend Forecast
            # y = mx + c (sales = m * time_index + c)
            historical_sales_df['time_index'] = np.arange(len(historical_sales_df))
            
            # Fit a linear model (degree 1 polynomial)
            # We need at least two points to fit a line
            if len(historical_sales_df) >= 2:
                coeffs = np.polyfit(historical_sales_df['time_index'], historical_sales_df['monthly_sales'], 1)
                slope = coeffs[0]
                intercept = coeffs[1]
            else: # Should not happen due to above check, but as a fallback
                slope = 0 
                intercept = historical_sales_df['monthly_sales'].mean() if not historical_sales_df.empty else 0

            last_date = historical_sales_df['month_start_date'].iloc[-1]
            last_time_index = historical_sales_df['time_index'].iloc[-1]
            
            forecast_data = []
            for i in range(1, forecast_months + 1):
                forecast_date = last_date + relativedelta(months=i)
                forecast_time_index = last_time_index + i
                forecasted_sales = slope * forecast_time_index + intercept
                # Ensure sales are not negative
                forecast_data.append({'month_start_date': forecast_date, 'monthly_sales': max(0, forecasted_sales), 'type': 'Forecast'})

            forecast_df = pd.DataFrame(forecast_data)
            
            # Combine historical and forecast data for plotting
            plot_df_hist = historical_sales_df[['month_start_date', 'monthly_sales']].copy()
            plot_df_hist['type'] = 'Historical'
            
            combined_df = pd.concat([plot_df_hist, forecast_df], ignore_index=True)

            fig_forecast = px.line(combined_df, x='month_start_date', y='monthly_sales', color='type',
                                   title=f"Sales Forecast ({forecast_months} Months Projection)", markers=True,
                                   labels={'month_start_date': 'Month', 'monthly_sales': 'Sales (LKR)'})
            fig_forecast.update_layout(legend_title_text='Data Type')
            st.plotly_chart(fig_forecast, use_container_width=True)

            st.subheader("Forecasted Values")
            st.dataframe(forecast_df[['month_start_date', 'monthly_sales']].rename(
                columns={'month_start_date': 'Forecast Month', 'monthly_sales': 'Projected Sales (LKR)'}
            ), use_container_width=True)
            
            st.write(f"Note: Forecast based on a simple linear trend (Slope: {slope:.2f}, Intercept: {intercept:.2f}).")

    else:
        st.info("No historical sales data found or error fetching data.")
else:
    st.error("Database connection failed. Please check your configuration.")
# Olist E-commerce Analytics Project

This repository supports the Project Design for an individual Big Data Analytics capstone project based on the Brazilian E-Commerce Public Dataset by Olist.

## Project Overview
The objective of this project is to develop a KPI-driven analytical framework to evaluate business performance and customer experience in a large-scale e-commerce environment. The analysis focuses on order-level aggregation, revenue patterns, delivery performance, and customer satisfaction metrics derived from transactional data.

Due to data limitations in the Olist dataset, profit margins are not computed directly in this project. Instead, revenue-based and operational performance indicators are used as measurable proxies for business performance.

## Research Focus
The project addresses the following refined research questions:

- **RQ1:** How do Monthly Total Revenue and Average Order Value (AOV) trend between 2017 and 2018, and what specific months demonstrate peak seasonality?
- **RQ2:** Is there a statistically significant association between Delivery Delay and Customer Satisfaction, and to what extent does this operational metric impact review scores?
- **RQ3:** How do order volume, revenue, and delivery performance vary across the top 5 Brazilian states?
- **RQ4:** Is there an association between order fulfillment performance, measured by delivery delay in days, and customer satisfaction, measured by average review score, at the order level?

## Repository Purpose
This repository documents the Exploratory Data Analysis (EDA) phase of the project. The included Jupyter Notebook provides evidence of data understanding, validation, and preparation before SQL-based aggregation, KPI analysis, and visualizations.

## Methodology & Project Stages
The codebase in this repository executes the following pipeline:
### 1. Data Ingestion & Cleaning: 
Loading raw CSV files and handling missing values (e.g., filtering unfulfilled orders to prevent skewed delay metrics).
### 2. SQL-to-Pandas Aggregation: 
Resolving One-to-Many relationships by aggregating the items and payments tables to the order_id level to prevent double-counting of revenue.
### 3. Feature Engineering:
Deriving new operational variables, specifically calculating delivery_delay_days from raw timestamps.
### 4. Exploratory Data Analysis (EDA):
Visualizing temporal revenue trends and state-level logistical bottlenecks using matplotlib and seaborn.
### 5.Statistical Testing:
Applying the Spearman Rank-Order Correlation to scientifically evaluate the non-parametric, ordinal relationship between delivery delays and customer review scores.

** No predictive modeling or machine learning techniques are applied at this stage **

## Evaluation Plan
Analytical results are evaluated using descriptive and consistency-based validation methods. Aggregated KPIs are validated through cross-table checks, including comparisons between row counts and distinct order identifiers after aggregation.

Temporal analyses use time-based grouping to assess continuity and trend stability across the project time span. Relationships between operational performance and customer satisfaction are interpreted as associations rather than causal effects.

Key evaluation metrics include total revenue, order volume, average delivery delay (in days), and average review score.

## Tools
- Python
- Jupyter Notebook
- SQL 
- Power BI

# Olist E-commerce Analytics Project

This repository supports the Project Design for an individual Big Data Analytics capstone project (CIND820) based on the Brazilian E-Commerce Public Dataset by Olist.

## 📊 Project Overview
The objective of this project is to develop a KPI-driven analytical framework to evaluate business performance and customer experience in a large-scale e-commerce environment. The analysis focuses on order-level aggregation, revenue patterns, delivery performance, and customer satisfaction metrics derived from transactional data.

Due to data limitations in the Olist dataset, profit margins are not computed directly in this project. Instead, revenue-based and operational performance indicators are used as measurable proxies for business performance.

## 🔗 Dataset Link
The working dataset used for this project is the **Brazilian E-Commerce Public Dataset by Olist**. Due to the large file sizes, the raw CSV files are not hosted in this repository. 
You can access and download the full original dataset here: [Olist Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## 🎯 Research Focus
The project addresses the following refined research questions:
* **RQ1:** How do Monthly Total Revenue and Average Order Value (AOV) trend between 2017 and 2018, and what specific months demonstrate peak seasonality?
* **RQ2:** Is there a statistically significant association between Delivery Delay and Customer Satisfaction, and to what extent does this operational metric impact review scores?
* **RQ3:** How do order volume, revenue, and delivery performance vary across the top 5 Brazilian states?

## 📁 Repository Contents
This repository documents both the Exploratory Data Analysis (EDA) and the **Milestone 3: Initial Results & Code** phases. 
Key files included in this repository:
* `EDA_notebook.ipynb`: Initial data exploration, validation, and cleaning.
* `database_architecture.sql`: SQL scripts demonstrating the aggregation logic used to resolve 1-to-many relationships.
* `Milestone3_Analysis.ipynb`: The main Python/Pandas codebase executing data aggregation, feature engineering, statistical testing, and final visualizations.
* `Milestone3_Analysis.html`: The compiled HTML version of the main Jupyter Notebook for easy viewing.

## ⚙️ Methodology & Project Stages
The codebase in this repository executes the following pipeline:
1.  **Data Ingestion & Cleaning:** Loading raw CSV files and handling missing values (e.g., filtering unfulfilled orders to prevent skewed delay metrics).
2.  **SQL-to-Pandas Aggregation:** Resolving One-to-Many relationships by aggregating the items and payments tables to the `order_id` level to prevent double-counting of revenue.
3.  **Feature Engineering:** Deriving new operational variables, specifically calculating `delivery_delay_days` from raw timestamps.
4.  **Exploratory Data Analysis (EDA) & Visualizations:** Visualizing temporal revenue trends and state-level logistical bottlenecks using Matplotlib and Seaborn.
5.  **Statistical Testing:** Applying the Spearman Rank-Order Correlation to scientifically evaluate the non-parametric, ordinal relationship between delivery delays and customer review scores.
*(Note: No predictive modeling or machine learning techniques are applied at this current stage).*

## 🛠️ Tools Used
* Python (Pandas, Matplotlib, Seaborn, SciPy)
* Jupyter Notebook / Google Colab
* SQL
* Power BI

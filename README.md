# Olist E-commerce Analytics Project

This repository supports the Project Design for an individual Big Data Analytics capstone project based on the Brazilian E-Commerce Public Dataset by Olist.

## Project Overview
The objective of this project is to develop a KPI-driven analytical framework to evaluate business performance and customer experience in a large-scale e-commerce environment. The analysis focuses on order-level aggregation, revenue patterns, delivery performance, and customer satisfaction metrics derived from transactional data.

Due to data limitations in the Olist dataset, profit margins are not computed directly in this project. Instead, revenue-based and operational performance indicators are used as measurable proxies for business performance.

## Research Focus
The project addresses the following refined research questions:

- **RQ1:** How do key business performance indicators (KPIs), including total revenue, order volume, and average order value, describe overall e-commerce performance trends over time between 2017 and 2018?

- **RQ2:** How does total order revenue vary across geographic regions at the customer state level, and which regions contribute most significantly to overall revenue?

- **RQ3:** What temporal patterns and trends can be observed in order volume and total revenue over the project time span, and how do these patterns reflect monthly or seasonal variations in customer purchasing behavior?

- **RQ4:** Is there an association between order fulfillment performance, measured by delivery delay in days, and customer satisfaction, measured by average review score, at the order level?

## Repository Purpose
This repository documents the Exploratory Data Analysis (EDA) phase of the project. The included Jupyter Notebook provides evidence of data understanding, validation, and preparation before SQL-based aggregation and KPI analysis and visualizations.

## EDA Scope
The EDA notebook includes:
- Loading and inspecting raw CSV datasets
- Examining dataset dimensions and column structures
- Identifying missing values in key attributes
- Validating the uniqueness of `order_id` in order-level tables
- Confirming expected one-to-many relationships in transactional tables
- Computing basic descriptive statistics

No predictive modeling or machine learning techniques are applied at this stage.

## Evaluation Plan
Analytical results are evaluated using descriptive and consistency-based validation methods. Aggregated KPIs are validated through cross-table checks, including comparisons between row counts and distinct order identifiers after aggregation.

Temporal analyses use time-based grouping to assess continuity and trend stability across the project time span. Relationships between operational performance and customer satisfaction are interpreted as associations rather than causal effects.

Key evaluation metrics include total revenue, order volume, average delivery delay (in days), and average review score.

## Tools
- Python
- Jupyter Notebook
- SQL 
- Power BI

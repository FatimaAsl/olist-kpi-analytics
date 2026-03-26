-- ==============================================================================
-- CIND820 Big Data Analytics Project - Milestone 3
-- Author: Fatima Aghapourasl
-- Description: Data architecture, aggregation, and analysis for Olist E-commerce
-- Note: This script resolves one-to-many relationships before generating insights.
-- ==============================================================================

USE olist;

-- ------------------------------------------------------------------------------
-- ## STEP 1: RESOLVING ONE-TO-MANY RELATIONSHIPS (DATA AGGREGATION)
-- ------------------------------------------------------------------------------

-- 1.1 Aggregate Payments: Summing installments per order to prevent double-counting
DROP TABLE IF EXISTS payments_agg;
CREATE TABLE payments_agg AS
SELECT 
  order_id,
  SUM(payment_value) AS total_payment
FROM olist_order_payments_dataset
GROUP BY order_id;

-- 1.2 Aggregate Items: Grouping multiple items purchased in a single order
DROP TABLE IF EXISTS items_agg;
CREATE TABLE items_agg AS
SELECT 
  order_id,
  COUNT(*) AS total_items,
  SUM(price) AS total_price,
  SUM(freight_value) AS total_freight,
  AVG(price) AS avg_item_price
FROM olist_order_items_dataset
GROUP BY order_id;

-- 1.3 Aggregate Reviews: Keeping only the latest review timestamp if multiple exist
DROP TABLE IF EXISTS reviews_agg;
CREATE TABLE reviews_agg AS
SELECT 
  r.order_id, 
  r.review_score, 
  r.review_creation_date, 
  r.review_answer_timestamp
FROM olist_order_reviews_min r
JOIN (
  SELECT order_id, MAX(review_answer_timestamp) AS max_answer_ts
  FROM olist_order_reviews_min
  GROUP BY order_id
) t 
  ON r.order_id = t.order_id 
 AND r.review_answer_timestamp = t.max_answer_ts;


-- ------------------------------------------------------------------------------
--## STEP 2: CREATING THE MASTER DATASET
-- ------------------------------------------------------------------------------

-- Joining all aggregated tables to the main orders table
DROP TABLE IF EXISTS order_master;
CREATE TABLE order_master AS
SELECT 
  o.order_id,
  o.customer_id,
  o.order_status,
  o.order_purchase_timestamp,
  o.order_approved_at,
  o.order_delivered_customer_date,
  o.order_estimated_delivery_date,
  
  c.customer_city,
  c.customer_state,
  
  ia.total_items,
  ia.total_price,
  ia.total_freight,
  ia.avg_item_price,
  
  pa.total_payment,
  
  ra.review_score,
  ra.review_creation_date,
  ra.review_answer_timestamp

FROM olist_orders_dataset o
LEFT JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
LEFT JOIN items_agg ia ON o.order_id = ia.order_id
LEFT JOIN payments_agg pa ON o.order_id = pa.order_id
LEFT JOIN reviews_agg ra ON o.order_id = ra.order_id;

-- Adding indexes to improve query performance for analytics
CREATE INDEX idx_master_order_id ON order_master(order_id);
CREATE INDEX idx_master_customer_id ON order_master(customer_id);


-- ------------------------------------------------------------------------------
-- ## STEP 3: ANALYTICAL QUERIES (Answering Research Questions)
-- ------------------------------------------------------------------------------

-- KPI 1: Top 5 Brazilian States by Total Revenue (Answers RQ3)
SELECT 
  c.customer_state, 
  SUM(p.total_payment) AS revenue, 
  COUNT(DISTINCT o.order_id) AS num_orders
FROM order_master o
JOIN payments_agg p ON o.order_id = p.order_id
JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY revenue DESC
LIMIT 5;

-- KPI 2: Overall Average Delivery Delay in Days
SELECT 
  AVG(DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)) AS avg_delay_days
FROM order_master
WHERE order_delivered_customer_date IS NOT NULL 
  AND order_estimated_delivery_date IS NOT NULL;

-- KPI 3: Percentage of Late Orders
SELECT 
  (SUM(CASE WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date) > 0 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS pct_late_orders
FROM order_master
WHERE order_delivered_customer_date IS NOT NULL 
  AND order_estimated_delivery_date IS NOT NULL;

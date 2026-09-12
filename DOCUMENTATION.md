# Retail Sales Data Validation & Performance Dashboard

## Overview
End-to-end data analysis project covering data validation, SQL-based analysis, and dashboard development on a retail sales dataset (9,994 orders, 2014–2017). Built to demonstrate the full analyst workflow: raw data → validated data → business insight → stakeholder-ready visualization.

## Dataset
- **Source:** Superstore Sales Dataset (Kaggle)
- **Size:** 9,994 order-line records across Order, Customer, Product, and Sales/Profit dimensions
- **Fields:** Order ID, Order/Ship Date, Customer, Segment, Region, Category, Sub-Category, Sales, Quantity, Discount, Profit

## Tools Used
PostgreSQL (data storage, SQL analysis) · Power BI (dashboard/visualization) · SQL (joins, aggregations, CASE-based segmentation)

## Data Validation Steps
1. **Date format verification** — cross-checked Order Date and Ship Date values to confirm actual date format (MM-DD-YYYY vs ambiguous DD-MM-YYYY) before import, preventing silent date corruption.
2. **Logical consistency check** — validated that no order shipped before it was placed (`ship_date >= order_date`); confirmed zero violations across all 9,994 records.
3. **Anomaly detection on profitability** — flagged all orders with negative profit for further analysis rather than treating them as clean data.

## Key Findings
| Finding | Detail |
|---|---|
| Regional performance gap | West region leads on both sales ($725K) and profit ($108K); Central generates high sales volume ($501K) but the lowest profit ($39.7K) — a profit-efficiency gap worth flagging to leadership. |
| Loss-making orders | 1,871 orders (18.7% of all orders) are unprofitable, totaling **-$156,131.86** in losses. |
| Root cause: discounting | Orders with discounts above 20% average **-$90 loss per order**; orders with no discount average **+$66.90 profit per order** — a swing of over $150 per order tied directly to discount policy. |
| Seasonality | Sales spike consistently in September, November, and December every year (holiday/fiscal cycle); January and February are consistently the weakest months. |

## Recommendation
Cap discretionary discounts at 20% for standard orders; require manager approval for discounts above that threshold. This single policy change targets the primary driver of the -$156K in identified losses without needing to touch pricing or product mix.

## Dashboard
Interactive Power BI dashboard includes: KPI summary cards (total sales, profit, loss-order count), regional sales/profit comparison, monthly sales trend, profit-by-discount-band breakdown, and top 10 products by profit.

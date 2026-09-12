# Retail Sales Data Validation & Performance Dashboard

SQL + Power BI project analyzing 9,994 retail orders to validate data accuracy, uncover profitability drivers, and build a stakeholder-ready performance dashboard.

## What this project does
- Loads and validates raw retail sales data in PostgreSQL (date logic checks, order/ship sequence validation)
- Runs SQL analysis to surface regional performance, monthly trends, and profitability anomalies
- Identifies that discounts above 20% are the primary driver of $156K+ in order-level losses
- Visualizes findings in an interactive Power BI dashboard

## Key Insight
**1,871 orders (18.7%) lost a combined $156,131.86** — traced directly to discount levels above 20%, which average a **-$90 loss per order**, versus **+$66.90 profit per order** with no discount applied.

## Tech Stack
`PostgreSQL` · `SQL` · `Power BI`

## Repo Structure
```
├── queries.sql          # All SQL analysis queries
├── DOCUMENTATION.md      # Full write-up: validation steps, findings, recommendation
├── dashboard_screenshot.png
└── README.md
```

## Dashboard Preview
*(Add your Power BI screenshot here)*

## Findings Summary
- West region: highest sales ($725K) and profit ($108K)
- Central region: high sales volume ($501K) but lowest profit ($39.7K) — profit-efficiency gap
- Sales peak every September–December, dip every January–February
- Discounting above 20% is the direct cause of the majority of loss-making orders

See [DOCUMENTATION.md](./DOCUMENTATION.md) for full methodology and recommendations.

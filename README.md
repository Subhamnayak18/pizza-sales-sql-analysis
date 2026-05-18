# 🍕 Pizza Sales SQL Analysis Project

## 📌 Project Overview

This project analyzes pizza sales data using PostgreSQL and SQL to uncover business insights, customer ordering behavior, and revenue trends.

The project demonstrates beginner-to-advanced SQL skills through real-world business questions and structured data analysis.

---

# 🛠️ Tools Used

- PostgreSQL
- VS Code
- SQLTools
- Git & GitHub

---

# 📂 Dataset Information

The dataset contains four main tables:

| Table Name | Description |
|---|---|
| orders | Stores order date and time |
| order_details | Stores ordered pizzas and quantities |
| pizzas | Contains pizza sizes and prices |
| pizza_types | Contains pizza names, categories, and ingredients |

---

# 🧠 SQL Concepts Used

## Basic SQL
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- COUNT
- SUM
- AVG

## Intermediate SQL
- JOINs
- HAVING
- Subqueries
- Aggregate Functions

## Advanced SQL
- Window Functions
- RANK()
- CTEs
- Revenue Analysis
- Cumulative Revenue
- Partitioning

---

# 📊 Business Questions Solved

## Basic Analysis
- Retrieve total number of orders
- Calculate total revenue
- Find highest-priced pizza
- Identify most common pizza size
- Find top 5 ordered pizzas

## Intermediate Analysis
- Category-wise quantity analysis
- Orders distribution by hour
- Daily average pizzas sold
- Revenue-based pizza analysis

## Advanced Analysis
- Percentage revenue contribution
- Cumulative revenue over time
- Top pizzas by category using RANK()

---

# 📈 Key Business Insights

- Large-sized pizzas generated high revenue.
- Peak ordering hours occurred during evening periods.
- Chicken category pizzas performed strongly.
- Revenue showed steady cumulative growth over time.
- Certain pizza types consistently dominated sales.

---

# 📁 Project Structure

```text
pizza-sales-sql-analysis/
│
├── datasets/
│   ├── orders.csv
│   ├── order_details.csv
│   ├── pizzas.csv
│   └── pizza_types.csv
│
├── outputs/
│
├── sql/
│   ├── basic_analysis.sql
│   ├── intermediate_analysis.sql
│   ├── advanced_analysis.sql
│   └── database_setup.sql
│
├── .gitignore
└── README.md

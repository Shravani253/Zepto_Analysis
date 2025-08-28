# Zepto_Analysis
Zepto Analysis : SQL-based exploration and analysis
This repository contains an analysis of Zepto dataset (CSV file), uploaded in UTF-8 encoding with comma delimiter.

Introduction

This project analyzes the Zepto real-time product dataset sourced from Kaggle. The dataset contains product-level details such as category, pricing, discounts, stock availability, and weight. The goal of this analysis is to clean, explore, and generate actionable insights using SQL queries.

Objective

To perform data cleaning and ensure accuracy in product-level details.
To explore categories, discounts, pricing patterns, and stock availability.
To calculate business insights such as estimated revenue, discount trends, and inventory weight distribution.
To segment products into value categories (low, medium, bulk) for better inventory understanding.

Methodology

The analysis was carried out using SQL queries in the following steps:
Data Exploration: Counted rows, checked null values, identified unique categories, analyzed stock status, and detected duplicate products.
Data Cleaning: Removed invalid entries (e.g., MRP = 0), corrected unit inconsistencies by converting values from paise to rupees.

Business Analysis:
Identified top discounted products and premium products with low discounts.
Calculated category-wise estimated revenue.
Analyzed stock shortages in high-priced items.
Ranked products based on price per gram for value assessment.
Segmented products into weight categories (Low, Medium, Bulk).
Measured total inventory weight per category.

Conclusion

The SQL analysis revealed key insights into Zepto’s inventory and pricing trends. Categories with higher discounts and strong revenue contribution were identified, while high-value out-of-stock products highlighted stock management challenges. Weight-based segmentation provided clarity on product distribution, and price-per-gram analysis revealed best-value items. Overall, the project demonstrates how SQL can be effectively used for end-to-end business data analysis on real-time datasets.

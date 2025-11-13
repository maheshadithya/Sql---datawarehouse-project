# Sales & Customer Analytics — Medallion Architecture (Bronze → Silver → Gold)

A complete end-to-end Data Engineering & Analytics project built using the Medallion Architecture in SQL Server.  
This pipeline ingests raw CRM & ERP data, cleans and standardizes it, builds dimensional models, and generates analytical insights across products, customers, and sales trends.

---

## Table of Contents
- Project Overview
- Architecture
- Data Sources
- Bronze → Silver → Gold Pipeline
- Data Models
- Data Cleaning Rules
- Analytics & Reporting
- Key SQL Scripts
- Data Quality Checks
- Repository Structure
- Getting Started
- Future Enhancements
- Contact

---

# Project Overview

This project demonstrates a production-style data analytics pipeline using:

- Raw ingestion from CRM and ERP CSV files  
- Data cleaning and standardization  
- Dimensional modeling (Star Schema)  
- Analytics-ready Gold layer tables and views  
- Advanced SQL analytics queries  

Use cases:

- Product performance analysis  
- Customer segmentation and RFM insights  
- Category contribution reporting  
- Revenue trends and Year-over-Year comparisons  
- Cleaned and validated data for BI dashboards  

---

# Architecture

This project uses the Medallion Architecture:

Bronze (Raw) → Silver (Cleaned) → Gold (Analytics)

## Bronze Layer
Stores raw CRM & ERP CSVs as-is for traceability.

## Silver Layer
Cleans, standardizes, de-duplicates, and enriches the data.

## Gold Layer
Creates business-friendly fact/dimension models and analytical views.

---

# Data Sources

## CRM System
- crm_cust_info  
- crm_prd_info  
- crm_sales_details

## ERP System
- erp_px_cat_g1v2  
- erp_cust_az12  
- erp_loc_a101

---

# Bronze → Silver → Gold Pipeline

## Bronze Layer (Raw)
- Loaded using BULK INSERT.
- No transformations applied.
- Purpose: maintain original source for audit and replay.

## Silver Layer (Cleaned)
Key transformations include:
- Trim and normalize names  
- Expand gender codes (M → Male, F → Female)  
- Normalize marital status  
- Fix invalid dates  
- Recalculate incorrect sales amounts  
- Standardize product lines  
- Clean country codes  
- Remove invalid birthdates  
- Deduplicate customers using ROW_NUMBER()  

## Gold Layer (Analytics)
Gold models include:
- dim_customers  
- dim_products  
- fact_sales  
- report_products (aggregated KPIs)

Purpose:
- Power BI dashboards  
- Analytical SQL workloads  
- Business analytics  

---

# Data Models

## Fact Table
fact_sales  
- order_number  
- product_key  
- customer_key  
- sales_amount  
- quantity  
- price  
- order/due/shipping dates  

## Dimension Tables

### dim_customers
- Name  
- Gender  
- Birthdate  
- Country  
- Marital status  

### dim_products
- Product name  
- Category  
- Subcategory  
- Product line  
- Cost  
- Start and end dates  

---

# Data Cleaning Rules

## Date Fixing

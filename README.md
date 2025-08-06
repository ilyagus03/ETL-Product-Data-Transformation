# ETL Product Data Transformation

A comprehensive ETL project that consolidates three years of product order data (2022-2024) from disparate formats into a unified staging table for business analysis.

## 📋 Project Overview

This project addresses the challenge of combining product order data from multiple years, where each year had different data structures and business rules. The solution creates a standardized schema while preserving data integrity and calculating missing business metrics.

## 🎯 Business Challenge

- **2022 Data**: Complete geographic information, standard format
- **2023 Data**: Split shipments due to shipping issues (Quantity_1 + Quantity_2), missing geographic data  
- **2024 Data**: New discount policy implementation, subtotal and discount calculations

## 🔧 Technical Solution

### Key Transformations

**2022 Data Processing**
- Field renaming for consistency (`Product` → `Product_Name`)
- Added customer_id as NULL (tracking not implemented)
- Tagged all records with year 2022

**2023 Data Processing**  
- Combined split quantity fields: `(Quantity_1 + Quantity_2)`
- Calculated missing order totals: `Per-Unit_Price * Total_Quantity`
- Set geographic fields as NULL (not tracked in 2023)
- Preserved Customer_ID information

**2024 Data Processing**
- Implemented discount calculation: `Order_Subtotal - Quantity_Discount`
- Maintained full geographic information
- Set customer_id as NULL (tracking discontinued)

## 📊 Results

- **Unified Dataset**: Successfully consolidated 3 years of disparate data formats
- **Data Completeness**: Calculated missing fields for business analysis
- **Quality Assurance**: Verified data integrity (Checksum: 1537)
- **Analysis Ready**: Clean, consistent schema ready for BI tools

## 💻 Technologies Used

- SQL for data transformation and schema design
- Database management and data validation
- ETL best practices and data quality assurance

## 📁 Repository Structure

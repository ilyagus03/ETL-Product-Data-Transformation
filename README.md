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

```
sql/
├── 01_create_staging_table.sql       # Table schema definition
├── 02_transform_2022_data.sql        # 2022 data transformation
├── 03_transform_2023_data.sql        # 2023 data transformation
├── 04_transform_2024_data.sql        # 2024 data transformation
├── 05_data_validation.sql            # Checksum and validation
└── complete_etl_script.sql           # Full transformation script

docs/
├── project_requirements.md           # Business requirements
├── data_dictionary.md                # Field definitions
└── transformation_notes.md           # Technical decisions

samples/
├── 2022_data_sample.csv
├── 2023_data_sample.csv
├── 2024_data_sample.csv
└── final_staging_sample.csv
```

## 🚀 Quick Start

1. Run the complete ETL script: `sql/complete_etl_script.sql`
2. Verify data quality: `sql/05_data_validation.sql`
3. Check sample outputs in `samples/` folder

## 📈 Business Impact

- Cross-year trend analysis capability
- Consistent business reporting foundation
- Reliable data for decision-making
- Streamlined analytical workflows

## 🔍 Key Learnings

- **Data Evolution**: Handling changing business requirements across multiple years
- **Field Calculation**: Computing derived metrics from incomplete source data
- **Quality Assurance**: Implementing checksum validation for data integrity
- **Schema Design**: Balancing standardization with source system constraints

## 🏗️ Implementation Details

### Data Quality Measures
- **Checksum Validation**: `sum(yearInt * monthInt * orderTotal) % 2341 = 1537`
- **NULL Handling**: Strategic use of NULL for missing/discontinued fields
- **Field Validation**: Consistent data types across all years

### Business Rules Applied
- **2023 Shipping Issues**: Combined split quantities into single total
- **2024 Discount Policy**: Subtracted quantity discounts from order subtotals
- **Geographic Consistency**: Maintained regional data where available

## 📚 Documentation

- **Business Requirements**: See `docs/project_requirements.md`
- **Data Dictionary**: Field definitions in `docs/data_dictionary.md`
- **Technical Notes**: Implementation decisions in `docs/transformation_notes.md`

## 🎯 Future Enhancements

- Automated data validation scripts
- Performance optimization for larger datasets
- Integration with BI tools and dashboards
- Error handling and logging mechanisms

## 📧 Contact

Built as part of data engineering portfolio. Questions? Feel free to reach out!

---

**Next Phase**: Quality assurance testing and analytical reporting implementation

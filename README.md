# 🚕 Uber Trip Data Dimensional Modeling and Analytics

## Objective

### 💡 Problem Statement
The raw **CSV data** for Uber trips is currently stored in a **flat file structure**. This flat structure is sub-optimal for sophisticated querying, performance-intensive business intelligence (BI) reporting, and large-scale data analysis due to data redundancy and lack of clear structure.

### 🎯 Objective
The primary objective is to implement a robust **Extract, Transform, Load (ETL)** pipeline that converts the flat CSV data into a **Star Schema**—comprising **Fact** and **Dimension tables**—within a cloud data warehouse. This transformation will optimize the data for rapid analytical queries and create a foundation for insightful BI dashboards.

---

## Tools & Project Architecture
This project leverages the **Google Cloud Platform (GCP)** ecosystem and standard data engineering tools to build a scalable, cloud-based data solution.

### 🛠️ Key Technologies
| Category | Tool | Purpose |
| :--- | :--- | :--- |
| **Data Source** | Flat CSV File | Source of raw Uber trip records. |
| **Data Modeling** | **Lucidchart** | Visual design and documentation of the Star Schema (Fact and Dimension tables). |
| **ETL Pipeline** | **Python** / Pandas | Scripting, data cleaning, and core dimensional transformation logic. |
| **Data Warehouse** | **Google BigQuery** | Scalable, serverless cloud data warehouse for storing the optimized Fact and Dimension tables. |
| **Visualization** | **Looker Studio** | Creating interactive dashboards to derive insights from the modeled data in BigQuery. |

### 🏗️ Project Architecture
The architecture illustrates the flow of data from the raw source through the dimensional modeling stage to final visualization.



The key stages are:
1.  **Extract:** Raw CSV data is ingested.
2.  **Model/Transform:** Python scripts apply the **Star Schema design** (Fact and Dimension tables) to transform the flat file.
3.  **Load:** The structured tables are loaded into **BigQuery**.
4.  **Analyze/Visualize:** Looker Studio connects to BigQuery for report generation.

---

## Methodologies

The project followed a **Dimensional Modeling** and **ETL-based** methodology to ensure data quality, integrity, and analytical efficiency.

### 1. Data Analysis and Schema Design
* **Source Review:** The flat CSV structure was thoroughly examined to identify and group primary entities, such as trips, locations, and time-based attributes.
* **Dimensional Modeling:** The schema was designed in **Lucidchart** following the Star Schema convention. This design resulted in a central **Fact Table** (`fact_trips`) linked to several surrounding **Dimension Tables** (`dim_datetime`, `dim_location`, `dim_rate_code`, etc.).

### 2. ETL Implementation (Python)
The Python script served as the core transformation engine, performing sequential steps based on the designed schema:
* **Data Cleaning:** Handled null values, corrected inconsistent data types, and standardized text fields.
* **Dimensional Split:** The raw data was partitioned to create the Dimension tables first.
* **Key Generation:** **Surrogate keys** (e.g., `datetime_id`, `location_id`) were generated and assigned to the dimension tables to enforce referential integrity.
* **Fact Table Creation:** The central **Fact Table** was then built by mapping the transaction data back to the newly created surrogate keys.

### 3. Loading and Validation
* **BigQuery Integration:** The structured Fact and Dimension tables were created and loaded into Google BigQuery.
* **Validation:** SQL queries were executed in BigQuery to validate the data volume, check for data transformation errors, and verify the relationships between the Fact and Dimension tables.

---

## Findings / Outcome

The project successfully transformed raw, complex data into a structured, highly performant analytical asset.

### 📊 Key Outcomes
* **Optimized Performance:** The **Star Schema** architecture drastically reduced data redundancy and significantly improved query performance in BigQuery compared to analyzing the original flat file.
* **Enhanced Data Clarity:** The separation into Fact (metrics) and Dimension (attributes) tables provides an intuitive and accessible structure for business analysts.
* **Actionable Insights:** The modeled data in BigQuery serves as a reliable source for **Looker Studio** dashboards, enabling stakeholders to easily analyze key metrics such as peak trip times, popular routes, and fare distribution.

### **Next Steps:**
* Implement scheduling (e.g., using **Mage**) to automate the ETL pipeline for incremental data loads.


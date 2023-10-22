# Project 3

## Introduction
- **Project Overview**: The project aims to analyze Data Science job postings to determine the most frequently mentioned required qualifications. We will be delving into the dataset to focus specifically on Data Science positions.
- **Objectives**: Our primary objective is to assess the correlation between specific skills and salary offers. We seek to identify which skills are deemed most valuable in terms of compensation.
- **Team Members**: Zainab Oketokoun, Selina Noori, Gavriel Steinmetz-Silber,and Haig Bedros.

## Data Gathering and Source

## Data Sources
- **Primary Data Source**: 
  - **Description**: 
    - The primary data source is the "LinkedIn Job Postings - 2023" dataset. This dataset offers a comprehensive record of over 15,000 job postings listed on LinkedIn over two days. Each job posting includes 27 attributes, such as title, job description, salary, location, and work types. Additional files provide details on benefits, skills, and industries associated with each posting. There's also a separate csv file listing companies with attributes like company description, headquarters location, number of employees, and follower count.
  - **Link**: [LinkedIn Job Postings - 2023 on Kaggle](https://www.kaggle.com/datasets/arshkon/linkedin-job-postings)
  
- **Secondary Data Source**: 
  - **Description**: 
    - Skeleton Code from GitHub. This code provides a foundation for scraping LinkedIn job postings and might have been used to gather the dataset.
  - **Link**: [Skeleton Code on GitHub](https://github.com/ArshKA/LinkedIn-Job-Scraper)

## Data Collection Methodology

### Tools and Scripts:

- `search_retriever.py`: 
  - Discovers new job postings and inserts the most recent IDs into the database.
  
- `details_retriever.py`: 
  - Populates the table with individual job attributes.
  
### Important Notes:

 - `search_retriever.py` typically runs smoothly, even through a personal IP and a singular account. However, `details_retriever.py` can be more challenging. Each search generates approximately 25-50 results, requiring individual queries to obtain their attributes. 


## Data Normalization

- **Objective**: 
  - Streamlining the diverse tables and attributes in our dataset for efficient analysis. The primary goal was to reduce data redundancy and improve data integrity.

- **Normalization Techniques Used**: 
  - The dataset was provided in a normalized format with tables such as `companies.csv`, `job_postings.csv`, and others. During migration to Amazon RDS with MySQL, we refined the data structure, establishing primary and foreign keys for relational integrity.
  - **Tools/Libraries Used**: Amazon RDS with MySQL.

- **Outcome**: 
  - Achieved a dataset with better data consistency, reduced redundancy, and structures primed for efficient querying.

## Relational Data Model

- **Objective**: 
  - Establishing relationships between datasets, enabling complex queries, and maintaining data integrity.

- **Schema Diagram**: 
  - **Key Tables and Attributes**: 
    - `job_postings` with primary key `job_id`
    - `companies` with primary key `company_id`
  - **Relationships**: Established using foreign keys, fostering links between relevant data across tables.

- **Normalization Levels**: 
  - Adherence to the Third Normal Form (3NF) was ensured, eliminating transitive dependencies for a streamlined data structure.

## Data Cleanup

- **Objective**: 
  - Ensuring the dataset's accuracy and integrity for precise analysis.

- **Issues Addressed**: 
  - Missing Data: Encountered in essential fields.
  - Data Type Mismatch: Textual data in integer-designated columns.
  - Blank Values: Rectified by converting to NULL.
  - Non-ASCII Characters: Removed to avert import complications.

- **Cleanup Strategy**: 
  - Employed a Python function to normalize text, eliminate non-ASCII characters, and filter data.
  - **Tools/Libraries Used**: Python's `pandas` and `unicodedata`.

## Database Setup on Amazon RDS

- **Objective**:
  - To provide a centralized and shared database accessible to all project members.

- **Details**:
  - **Endpoint**: `database-1-instance-1.cngfftmjinac.us-east-2.rds.amazonaws.com`
  - **Port**: `3306`
  - **Availability Zone**: `us-east-2c`
  - **VPC**: `vpc-05f704c5f066b0e93`
  - **Public Accessibility**: Yes

## Data Migration with MySQL

- **Objective**: 
  - To seamlessly transfer the cleaned and normalized dataset into the shared MySQL database on Amazon RDS.

- **Steps**:
  1. **CSV to SQL**: Using tools like `pandas`, the cleaned dataset in CSV format was converted into SQL insert statements.
  2. **Establishing Primary and Foreign Keys**: Set up primary keys such as `job_id` for the `job_postings` table and `company_id` for the `companies` table. Relevant foreign key relationships were also established to ensure data integrity.
  3. **Data Import**: The SQL statements were executed on the Amazon RDS instance using MySQL commands, effectively migrating the dataset.
  4. **Validation**: Post-migration, sample queries were run to validate the data's integrity and ensure that the relationships were set up correctly.

## Analysis
- **Objective**: Describe what you aim to uncover or understand from the data.
- **Tools & Libraries**: List the tools and programming languages or libraries used for the analysis.
- **Methodology**: Outline the analytical methods or algorithms employed.
- **Preliminary Findings**: Share some initial insights or patterns observed (this can be updated as the analysis progresses).

## Conclusion and Next Steps
- **Summary**: Recap the main findings and their implications.
- **Recommendations**: Offer actionable insights or suggestions based on the analysis.
- **Future Work**: Suggest areas for further research or aspects of the project that could be expanded upon in the future.

## Appendices
- **Data Dictionary**: Provide a list of key terms or variables used, along with their definitions or descriptions.
- **References**: Cite any external sources, research papers, or datasets used in your project.

## Getting Started (For Developers)

- **Prerequisites**: 
  - **Software/Platforms**:
    - MySQL: For database operations and querying.
    - Amazon RDS: For hosting the shared database.
    - R: For data analysis and visualization.
  - **R Packages** (If you have specific packages in mind, they can be listed here. Otherwise, I'm adding some common ones):
    - `dplyr`: For data manipulation.
    - `ggplot2`: For data visualization.

- **Installation & Setup**: 
  1. **MySQL**:
     - Download and install MySQL from the [official website](https://dev.mysql.com/downloads/).
     - Ensure the MySQL server is running.
  2. **Amazon RDS**:
     - Set up an account on [Amazon AWS](https://aws.amazon.com/).
     - Navigate to RDS and create a new database instance. Use the provided details (Endpoint, Port, etc.) for connectivity.
  3. **R and R Packages**:
     - Install R from [CRAN](https://cran.r-project.org/).
     - In R, install the necessary packages:
       ```R
       install.packages(c("dplyr", "ggplot2"))
       ```

- **Running the Code**: 
  1. Once the data is migrated to the Amazon RDS database, utilize MySQL for any necessary database-related queries.
  2. For detailed data analysis and visualization, run your R scripts.

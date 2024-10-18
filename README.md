# Beginner ETL Pipeline

# End-to-End ETL Pipeline

This project provides a Python script that demonstrates a basic end-to-end ETL (Extract, Transform, Load) pipeline. It reads data from a specified source, performs various transformations, and then loads the processed data into a designated location. The `pipeline.py` script is well-documented to help you navigate through the project.

## Getting Started

To get started, download the project files to your local machine. You can run the script in a Python integrated development environment (IDE) or within a Python virtual environment.

### Prerequisites

Before running the project, ensure you have all required dependencies installed. Use the `requirements_txt.txt` file to install them. Make sure you are running the project within a virtual environment.

### Installation

1. **Set Up the Virtual Environment:**
   - Open a terminal and create a virtual environment:
     ```bash
     python -m venv venv
     ```
   - Activate the virtual environment:
     - **Windows:** `.\venv\Scripts\activate`
     - **macOS/Linux:** `source venv/bin/activate`

2. **Install Dependencies:**
   - Install the required packages using the `requirements_txt.txt` file:
     ```bash
     pip install -r requirements.txt
     ```

3. **Run the ETL Script:**
   - Navigate to the project directory and execute the `pipeline.py` script.
   - You can also run the script in an IDE after setting up the virtual environment.

4. **Database Setup:**
   - Make sure PostgreSQL is installed and running on your system.

## Data Transformations

The ETL script performs the following transformations:

1. Filters users from a specific country.
2. Extracts the country and city into separate columns.
3. Joins the filtered data with questions data, selecting only those with at least 20 views.
4. Merges the results with corresponding answers.

## Data Loading

The transformed data is loaded into a PostgreSQL database using SQL Data Definition Language (DDL) commands:

1. A new schema named `stackoverflow_filtered` is created.
2. A table called `results` is set up within the schema.
3. The data is written to the table using PySpark.
4. Indexes are created:
   - A B-tree index on the `reputation` column.
   - A hash index on the `display_name` column.
5. A view is created to display `display_name`, `city`, and `questions_id` for rows where `accepted_answer_id` is not null.
6. A materialized view similar to the above is also created.
7. The differences between regular views and materialized views are explained in the Jupyter notebook.

## Running Tests

After running the ETL process, the data should be successfully extracted, transformed, and loaded into a PostgreSQL database. You can use tools like DBeaver to manage and verify the PostgreSQL queries.

## Deployment

The ETL pipeline can be deployed in various environments for automated execution. Use Apache Airflow to schedule the pipeline's execution at specified intervals. Some adjustments to the script may be required to tailor it to your specific needs.

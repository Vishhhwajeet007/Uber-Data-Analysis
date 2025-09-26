# Import the necessary library
from google.cloud import bigquery
import os


PROJECT_ID = "uber-data-analysis-473212" 
DATASET_ID = "Uber_dataset" 

os.environ["GOOGLE_CLOUD_QUOTA_PROJECT"] = PROJECT_ID 

# Initialize the BigQuery Client
client = bigquery.Client(project=PROJECT_ID) 

print(f"BigQuery Client initialized for Project: {PROJECT_ID}")

# 1. Defining Tables and Load Configuration

tables = {
    'dim_datetime': datetime_dim,
    'dim_passenger_count': passenger_count_dim,
    'dim_trip_distance': trip_distance_dim,
    'dim_rate_code': rate_code_dim,
    'dim_pickup_location': pickup_location_dim,
    'dim_dropoff_location': dropoff_location_dim,
    'dim_payment_type': payment_type_dim,
    'fact_uber_trips': fact_table 
}

# Configuration for loading: 

job_config = bigquery.LoadJobConfig(
    write_disposition="WRITE_TRUNCATE", 
)

def load_to_bigquery(table_name, df):
    """Loads a DataFrame to a specified BigQuery table."""
   
    full_table_id = f"{DATASET_ID}.{table_name}"
    
    print(f"Starting load job for table: {full_table_id}...")
    
    try:
        # Load the DataFrame to BigQuery
        job = client.load_table_from_dataframe(
            df, 
            full_table_id, 
            job_config=job_config
        )
        job.result()
        
        print(f"✅ Loaded {len(df):,} rows into {full_table_id}. Schema written.")
        
    except Exception as e:
        print(f"Error loading {full_table_id}: {e}")

# 2.Load Sequence (Dimensions first, Fact last)

print("--- Starting Dimensional Table Load ---")

# Load Dimensions
dimension_tables = ['dim_datetime', 'dim_passenger_count', 'dim_trip_distance', 
                    'dim_rate_code', 'dim_pickup_location', 'dim_dropoff_location', 
                    'dim_payment_type']

for dim_name in dimension_tables:
    load_to_bigquery(dim_name, tables[dim_name])

# Load Fact Table
print("\n--- Starting Fact Table Load ---")
load_to_bigquery('fact_uber_trips', fact_table)

print("\nETL Load phase complete! Your Star Schema is built in Google BigQuery.")

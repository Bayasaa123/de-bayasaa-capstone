environment = "dev"
project = "data-lake"
instance_type = "t3.medium"
bucket_name = "bayasaa"
aws_region = "ap-southeast-2"
airflow_admin_user = "bayasaa"
airflow_admin_pass = "Bayasaa123"
dbt_container_image = "ghcr.io/dbt-labs/dbt-core:latest"
db_name = "airflow"
db_user = "airflow"
db_password = "airflow"
csv_objects = {
    "customers/customers.csv" = "../datasets/customers.csv",
    "accounts/accounts.csv" = "../datasets/accounts.csv",
    "transactions/transactions.csv" = "../datasets/transactions.csv",
    "time/time.csv" = "../datasets/time.csv"
}

python_objects = {
    "dags/extract.py" = "../scripts/extract.py"
}

databases = [
    { name = "airflow_db",   user = "airflow",   password = "airflow" },
    { name = "bootcamp_db",  user = "bootcamp", password = "password" },
    { name = "metabase_db",  user = "metabase_user", password = "metabase_password" }
]

ip_addresses = [ "10.20.1.50", "10.20.1.51" ]
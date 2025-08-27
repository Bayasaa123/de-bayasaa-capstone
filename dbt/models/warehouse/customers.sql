{{ config(
    materialized='incremental',
    incremental_strategy='append',
    unique_key='customer_code',
    on_schema_change='sync_all_columns'
) }}

with customers as (
    SELECT
        customer_code, 
        first_name, 
        last_name, 
        CONCAT(first_name, ' ', last_name) AS full_name,
        id_number, 
        date_of_birth, 
        gender, 
        email, 
        phone_number, 
        province, 
        city, 
        postal_code, 
        income_bracket, 
        employment_status, 
        credit_score, 
        primary_bank, 
        primary_branch,
        CAST('{{ var("load_date") }}' AS DATE) as load_date
    from
        {{ ref('stg_customers') }} c
)
select 
{{ dbt_utils.generate_surrogate_key(['customer_code', 'load_date']) }} as customer_pk,
c.*
from customers c
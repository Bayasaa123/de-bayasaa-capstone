{{ config(
    materialized='incremental',
    incremental_strategy='append',
    unique_key='account_pk',
    on_schema_change='sync_all_columns'
) }}

with accounts as (
    SELECT
        account_id, 
        account_number, 
        customer_code, 
        bank_name, 
        branch_name, 
        bank_code, 
        swift_code, 
        account_type, 
        opening_date, 
        balance, 
        account_status, 
        interest_rate, 
        currency,
        CAST('{{ var("load_date") }}' AS DATE) as load_date
    from
        {{ ref('stg_accounts') }}
)


select 
    {{ dbt_utils.generate_surrogate_key(['account_id', 'load_date']) }} as account_pk,
    account_id, 
    account_number, 
    customer_code, 
    bank_name, 
    branch_name, 
    bank_code, 
    swift_code, 
    account_type, 
    opening_date, 
    balance, 
    account_status, 
    interest_rate, 
    currency,
    load_date
from accounts a
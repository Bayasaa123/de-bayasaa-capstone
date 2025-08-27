{% macro update_scd (table_name, load_date) %}


    UPDATE {{ table_name }}
    SET end_date = CAST('{{ load_date }}' AS DATE),
        current_flag = FALSE
    WHERE customer_code IN (
        SELECT t.customer_code
        FROM {{ table_name }} t
        JOIN {{ ref('stg_customers') }} s
        ON t.customer_code = s.customer_code
        WHERE t.change_hash <> MD5(CONCAT(s.first_name, s.last_name, s.id_number, s.date_of_birth, s.gender, s.email, s.phone_number, s.province, s.city, s.postal_code, s.income_bracket, s.employment_status, s.credit_score, s.primary_bank, s.primary_branch))
    )
    AND current_flag = TRUE
    AND start_date < CAST('{{ load_date }}' AS DATE)

{% endmacro %}
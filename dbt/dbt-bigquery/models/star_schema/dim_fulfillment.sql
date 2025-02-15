-- dim_fulfillment
{{
  config(
    materialized='table'
  )
}}

-- Generate ID dengan utils
SELECT DISTINCT 
  {{ dbt_utils.generate_surrogate_key([
        'Fulfilment', 
        '`fulfilled-by`'
  ])}} AS fulfillment_id,
  Fulfilment AS fulfillment, 
  `fulfilled-by` AS fulfilled_by
FROM
    {{ source('bronze', 'amazon_sale_report') }}

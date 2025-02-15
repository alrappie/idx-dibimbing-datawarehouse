{{
  config(
    materialized='table'
  )
}}

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key([
        'LOWER(TRIM(`ship-country`))', 
        'LOWER(TRIM(`ship-state`))',
        '`ship-postal-code`', 
        'LOWER(TRIM(`ship-city`))',
        'LOWER(TRIM(`ship-service-level`))'
    ])}} AS shipment_id,
    lower(trim(`ship-country`)) AS ship_country,
    lower(trim(`ship-state`)) AS ship_state,
    `ship-postal-code` AS ship_postal_code,
    lower(trim(`ship-city`)) AS ship_city,
    lower(trim(`ship-service-level`)) AS ship_service_level
FROM 
    {{ source('bronze', 'amazon_sale_report') }}

-- dim_product
{{
  config(
    materialized='table'
  )
}}

SELECT DISTINCT 
  {{ dbt_utils.generate_surrogate_key([
	'`Sales Channel `'
  ]) }} as cales_channel_id,
    `Sales Channel ` as sales_channel
FROM
    {{ source('bronze', 'amazon_sale_report') }}
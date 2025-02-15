-- dim_product
{{
  config(
    materialized='table'
  )
}}

SELECT DISTINCT 
  {{ dbt_utils.generate_surrogate_key([
	'`promotion-ids`'
  ]) }} as promotion_id,
  `promotion-ids` AS promotion_ids,
FROM
    {{ source('bronze', 'amazon_sale_report') }}

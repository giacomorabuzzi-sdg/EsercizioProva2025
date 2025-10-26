SELECT
    COALESCE(stg_prod_new.model_name, stg_prod_old.model_name) AS model_name,
    COALESCE(stg_prod_new.brand, stg_prod_old.brand) AS model_brand,
    COALESCE(stg_prod_new.new_category, stg_prod_old.category) AS model_category,
    COALESCE(stg_prod_new.list_price, stg_prod_old.list_price) AS model_price,
    COALESCE(stg_prod_new.color, stg_prod_old.color) AS model_color,
    COALESCE(stg_prod_new.product_id, stg_prod_old.product_id) AS product_id,
    
    CASE
        WHEN stg_prod_old.product_id IS NULL THEN 'Inserted'
        WHEN stg_prod_new.product_id IS NULL THEN 'Deleted'
        
        WHEN stg_prod_new.change_date IS NOT NULL
             THEN 'Updated'
             
        ELSE 'No Change'
    END AS record_status,
    
    stg_prod_new.change_date AS last_changed_date

FROM 
    {{ ref('stg_prod') }} AS stg_prod_old
FULL JOIN 
    {{ ref('stg_prod_upd') }} AS stg_prod_new
    USING (product_id)
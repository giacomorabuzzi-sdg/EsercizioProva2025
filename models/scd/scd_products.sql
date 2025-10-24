select
    stg_prod_new.model_name as model_name,
    stg_prod_new.brand as model_brand,
    coalesce(stg_prod_new.category, stg_prod_old.category) as model_category,
    stg_prod_new.list_price as model_price,
    stg_prod_new.color as model_color,
    stg_prod_old.product_id

from {{ ref('stg_prod') }} as stg_prod_old
left outer join {{ ref('stg_prod_upd') }} as stg_prod_new
    using (product_id)
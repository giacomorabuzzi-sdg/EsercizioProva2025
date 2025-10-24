with products as (
    select * from {{ source('negozio', 'products_t1') }}
)

select * from products
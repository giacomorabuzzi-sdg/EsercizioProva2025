with products as (
    select * from {{ source('negozio', 'products_t0') }}
)

select * from products
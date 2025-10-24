with clients as (
    select * from {{ source('negozio', 'clients_t0') }}
)

select * from clients
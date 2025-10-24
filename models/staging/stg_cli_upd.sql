with clients as (
    select * from {{ source('negozio', 'clients_t1') }}
)

select * from clients
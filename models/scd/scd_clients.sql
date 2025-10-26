SELECT
    COALESCE(t1.name, t0.name) AS customer_name,
    COALESCE(t1.email, t0.email) AS customer_email,
    COALESCE(t1.city, t0.city) AS customer_city,
    COALESCE(t1.member_since, t0.member_since) AS customer_member_since,
    COALESCE(t1.customer_id, t0.customer_id) AS customer_id,
    CASE
        WHEN t0.customer_id IS NULL THEN 'Inserted'
        WHEN t1.customer_id IS NULL THEN 'Deleted'
        WHEN t0.name != t1.name
            OR t0.email != t1.email
            OR t0.city != t1.city
            OR t0.member_since != t1.member_since
            THEN 'Updated'
        ELSE 'No Change'
    END AS record_status

from {{ ref('stg_cli') }} as t0
full join {{ ref('stg_cli_upd') }} as t1
    using (customer_id)
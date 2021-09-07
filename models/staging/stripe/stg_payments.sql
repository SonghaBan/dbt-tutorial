with payments as (
    
    select 
        id as payment_id,
        orderid as order_id,
        status,
        paymentmethod as payment_method,
        -- amount is stored in cents, convert it to dollars
        {{ cents2dollars('amount') }} as amount,
        created as created_at

    from {{ source('stripe', 'payment') }}
)

select * from payments
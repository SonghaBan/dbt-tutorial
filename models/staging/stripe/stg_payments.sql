with payments as (
    
    select 
        id as payment_id,
        orderid as order_id,
        status,

        -- amount is stored in cents, convert it to dollars
        amount / 100 as amount,
        created as created_at

    from dbt-tutorial.stripe.payment
)

select * from payments
-- {{ config(materialized='view') }}
{{ config(materialized='table') }}

with contact_account as (
    select c.name as contact_name ,
mailing_city ,
mailing_state ,
c.phone as contact_phone ,
mobile_phone ,
email,
title ,
department,
a.name as account_name,
a.billing_street ,
a.billing_state,
a.phone as account_phone,
a.billing_country,
a.billing_postal_code
  from {{ source('salesforce_data', 'contact') }} as c
  join {{ source('salesforce_data', 'account') }} as a
  on c.account_id=a.id
  )  select * from contact_account
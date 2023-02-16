with 

examples as (

    select '0x3dbde985465c0e0' as hex_string, 278060547845767392 as num_value
    union all
    select '0x10266b3392cdca000', 18619766767557058560
    union all
    select '0xcd4403007840700', 924434398546495232
    union all
    select '0x3423dd0fc1636996', 3757089573895891350
    union all
    select '0x0', 0
    union all
    select '0x1', 1
    union all
    select null, null
  
),

test as (

    select
        *,
        hex_to_num(hex_string) as result
    from
        examples

)

select
    * 
from
    test 
where
    num_value != result

select
    date(date_trunc('day', to_timestamp(hex_to_num(blk.timestamp)))) as date_ymd,
    count(distinct tx.hash) as number_transactions,
    count(distinct tx.blockNumber) as number_blocks,
    sum(hex_to_num(value)) as total_value_wei,
    sum(hex_to_num(value) * (1/pow(10,18))) as total_value_eth
from 
    {{ref('transactions')}} as tx
    left join {{ref('blocks')}} as blk on (tx.blocknumber = blk.number)
group by
    date_ymd

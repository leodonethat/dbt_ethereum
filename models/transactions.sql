with 
blocks_transactions as (
    select
        json_array_elements(transactions::json) as transaction
    from
        {{ref('blocks')}}
),
transactions as (
    select
        transaction ->> 'r' as r,
        transaction ->> 's' as s,
        transaction ->> 'v' as v,
        transaction ->> 'to' as to,
        transaction ->> 'gas' as gas,
        transaction ->> 'from' as from,
        transaction ->> 'hash' as hash,
        transaction ->> 'type' as type,
        transaction ->> 'input' as input,
        transaction ->> 'nonce' as nonce,
        transaction ->> 'value' as value,
        transaction ->> 'chainId' as chainId,
        transaction ->> 'gasPrice' as gasPrice,
        transaction ->> 'blockHash' as blockHash,
        transaction ->> 'blockNumber' as blockNumber,
        transaction ->> 'transactionIndex' as transactionIndex
    from
        blocks_transactions
)
select
    *
from
    transactions

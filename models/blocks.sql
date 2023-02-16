with 
blocks as (
    select
        _airbyte_data ->> 'number' as number,
        _airbyte_data ->> 'hash' as hash,
        _airbyte_data ->> 'parentHash' as parentHash,
        _airbyte_data ->> 'nonce' as nonce,
        _airbyte_data ->> 'sha3Uncles' as sha3Uncles,
        _airbyte_data ->> 'logsBloom' as logsBloom,
        _airbyte_data ->> 'transactionsRoot' as transactionsRoot,
        _airbyte_data ->> 'stateRoot' as stateRoot,
        _airbyte_data ->> 'receiptsRoot' as receiptsRoot,
        _airbyte_data ->> 'miner' as miner,
        _airbyte_data ->> 'difficulty' as difficulty,
        _airbyte_data ->> 'totalDifficulty' as totalDifficulty,
        _airbyte_data ->> 'extraData' as extraData,
        _airbyte_data ->> 'size' as size,
        _airbyte_data ->> 'gasLimit' as gasLimit,
        _airbyte_data ->> 'gasUsed' as gasUsed,
        _airbyte_data ->> 'mixHash' as mixHash,
        _airbyte_data ->> 'timestamp' as timestamp,
        _airbyte_data ->> 'uncles' as uncles,
        _airbyte_data ->> 'transactions' as transactions,
        json_array_length((_airbyte_data ->> 'transactions')::json) as numberTransactions
    from
        _airbyte_raw_ethereum_blocks
)
select
    *
from
    blocks


## Using dbt to transform Ethereum data

This is a proof concept to create an analytics pipeline for Ethereum.

* Erigon is the Ethereum client and provides an API
* Airbyte extracts data from the API and loads it in a local postgres database
* DBT transforms the data in the local database

To try it out clone this repo and execute:

```bash
docker run -it \
--platform linux/amd64 \
--network=host \
--mount type=bind,source=/Users/leodonethat/GitHub/dbt_ethereum,target=/usr/app/dbt_ethereum \
--mount type=bind,source=/Users/leodonethat/dbt_profiles/,target=/root/.dbt/ \
ghcr.io/dbt-labs/dbt-postgres \
test --project-dir /usr/app/dbt_ethereum/
```

Note we need an extra `profiles.yml` in `/Users/leodonethat/dbt_profiles/` with the credentials for the postgres database.

For details on how to create this project for scratch follow the walkthrough in:

https://leo.sh/blockchain/2023/02/13/using_dbt_to_transform_ethereum_data.html

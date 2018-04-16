-- DDL Create statement for the table (Note: end with semicolon)
CREATE EXTERNAL TABLE IF NOT EXISTS warehouse.agg_table (
    col1 STRING,
    col2 STRING,
    col3 BIGINT
)
PARTITIONED BY (
    dt STRING
)
STORED AS PARQUET;


-- Insert data into the table

INSERT OVERWRITE TABLE warehouse.agg_table PARTITION (dt='{{ ds }}')
SELECT
    col1,
    col2,
    COUNT(col3)
FROM
    warehouse.raw_fact_table
GROUP BY
   col1,
   col2;
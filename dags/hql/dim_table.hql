-- DDL Create statement for the table (Note: end with semicolon)
CREATE EXTERNAL TABLE IF NOT EXISTS warehouse.dim_table (
    col1 STRING,
    col2 STRING
)
PARTITIONED BY (
    dt STRING
)
STORED AS PARQUET;


-- Insert data into the table

INSERT OVERWRITE TABLE warehouse.dim_table PARTITION (dt='{{ ds }}')
SELECT
    col1,
    col2
FROM
    warehouse.raw_dim_table
GROUP BY
   col1,
   col2;
config = [ 
  {
    "name" : "agg",
    "source": {
      "hql" : "hql/agg_table.hql",

      "dependencies":
        [
          { "db": "warehoue", 
            "table": "raw_fact_table", 
            "partition" : """dt='{{ ds }}' """
          }
        ], 

      "schedule_interval": "@daily",  #https://airflow.apache.org/scheduler.html

      "start_date": "2017-12-01"
    }
  }, 
  {
    "name" : "dim",
    "source": {
      "hql" : "hql/dim_table.hql",

      "dependencies":
        [
          { "db": "warehouse", 
            "table": "raw_dim_table", 
            "partition" : """ dt='{{ ds }}' """
          }
        ],

      "schedule_interval": "@daily",  

      "start_date": "2018-01-01"
    }
  }
]
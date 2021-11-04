

drop table gma_ods.ods_mysql_kafka_base_category1;

CREATE TABLE gma_ods.ods_mysql_kafka_base_category1 (
  id BIGINT,
  name STRING
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.base_category1',
  'properties.bootstrap.servers' = 'hadoop100:9092,hadoop101:9092,hadoop102:9092',
  'properties.group.id' = 'asdasasda',
  'format' = 'canal-json',
  'canal-json.ignore-parse-errors'='true'
);




select * from gma_ods.ods_mysql_kafka_base_category1 /*+ OPTIONS('scan.startup.mode'='earliest-offset') */;


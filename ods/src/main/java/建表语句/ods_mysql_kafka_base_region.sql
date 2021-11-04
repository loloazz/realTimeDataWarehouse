

drop table gma_ods.ods_mysql_kafka_base_region;

CREATE TABLE gma_ods.ods_mysql_kafka_base_region(
  id BIGINT,
  region_name STRING
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.base_region',
  'properties.bootstrap.servers' = 'hadoop100:9092,hadoop101:9092,hadoop102:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
  'canal-json.ignore-parse-errors'='true'
);




drop table gma_ods.ods_mysql_kafka_base_province;

CREATE TABLE gma_ods.ods_mysql_kafka_base_province(
  id BIGINT,
  name STRING,
  region_id BIGINT,
  area_code STRING
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.base_province',
  'properties.bootstrap.servers' = 'hadoop100:9092,hadoop101:9092,hadoop102:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
  'canal-json.ignore-parse-errors'='true'
);


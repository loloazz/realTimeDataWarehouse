

drop table gma_ods.ods_mysql_kafka_base_category3;

CREATE TABLE gma_ods.ods_mysql_kafka_base_category3(
  id BIGINT,
  name STRING,
  category2_id BIGINT
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.base_category3',
  'properties.bootstrap.servers' = 'hadoop100:9092,hadoop101:9092,hadoop102:9092',
  'properties.group.id' = 'sadasdsad',
  'format' = 'canal-json',
   'canal-json.ignore-parse-errors'='true'
);


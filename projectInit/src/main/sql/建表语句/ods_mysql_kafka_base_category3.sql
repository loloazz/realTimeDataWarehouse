

drop table gma_ods.ods_mysql_kafka_base_category3;

CREATE TABLE gma_ods.ods_mysql_kafka_base_category3(
  id BIGINT,
  name STRING,
  category2_id BIGINT
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.base_category3',
  'properties.bootstrap.servers' = 'master:9092,node1:9092,node2:9092',
  'properties.group.id' = 'sadasdsad',
  'format' = 'canal-json',
   'canal-json.ignore-parse-errors'='true'
);


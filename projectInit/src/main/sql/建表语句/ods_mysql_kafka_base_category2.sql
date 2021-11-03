

drop table gma_ods.ods_mysql_kafka_base_category2;

CREATE TABLE gma_ods.ods_mysql_kafka_base_category2(
  id BIGINT,
  name STRING,
  category1_id BIGINT
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.base_category2',
  'properties.bootstrap.servers' = 'master:9092,node1:9092,node2:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
  'canal-json.ignore-parse-errors'='true'
);


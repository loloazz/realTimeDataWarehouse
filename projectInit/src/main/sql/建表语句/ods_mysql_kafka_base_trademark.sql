

drop table gma_ods.ods_mysql_kafka_base_trademark;

CREATE TABLE gma_ods.ods_mysql_kafka_base_trademark(
  tm_id STRING COMMENT '品牌id',
  tm_name STRING COMMENT '品牌名称'
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.base_trademark',
  'properties.bootstrap.servers' = 'master:9092,node1:9092,node2:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
   'canal-json.ignore-parse-errors'='true'
);


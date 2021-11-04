
drop table gma_ods.ods_mysql_kafka_order_status_log;

CREATE TABLE gma_ods.ods_mysql_kafka_order_status_log(
  `id` int,
  `order_id` int,
  `order_status` int,
  `operate_time` TIMESTAMP(3)
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.order_status_log',
  'properties.bootstrap.servers' = 'hadoop100:9092,hadoop101:9092,hadoop102:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
  'canal-json.ignore-parse-errors'='true'
);


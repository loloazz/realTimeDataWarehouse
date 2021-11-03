

drop table gma_ods.ods_mysql_kafka_date_info;

CREATE TABLE gma_ods.ods_mysql_kafka_date_info(
date_id int,
`week_id` int,
`week_day` int,
`day` int,
`month` int,
`quarter`int,
`year` int,
`is_workday` int,
`holiday_id` int
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.date_info',
  'properties.bootstrap.servers' = 'master:9092,node1:9092,node2:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
    'canal-json.ignore-parse-errors'='true'
);

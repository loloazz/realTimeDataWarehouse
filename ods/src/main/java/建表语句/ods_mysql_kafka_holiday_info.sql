

drop table gma_ods.ods_mysql_kafka_holiday_info;

CREATE TABLE gma_ods.ods_mysql_kafka_holiday_info(
`holiday_id` int,
 `holiday_name`STRING
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.holiday_info',
  'properties.bootstrap.servers' = 'hadoop100:9092,hadoop101:9092,hadoop102:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
    'canal-json.ignore-parse-errors'='true'
);

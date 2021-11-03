

drop table gma_ods.ods_mysql_kafka_holiday_year;

CREATE TABLE gma_ods.ods_mysql_kafka_holiday_year(
  `year_id` INT,
  `holiday_id` INT,
  `start_date_id`INT,
  `end_date_id`INT
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.holiday_year',
  'properties.bootstrap.servers' = 'master:9092,node1:9092,node2:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
   'canal-json.ignore-parse-errors'='true'
);


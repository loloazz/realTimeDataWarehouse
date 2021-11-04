
drop table gma_ods.ods_mysql_kafka_payment_info;

CREATE TABLE gma_ods.ods_mysql_kafka_payment_info(
  `id` bigint COMMENT '编号',
  `out_trade_no` STRING COMMENT '对外业务编号',
  `order_id` STRING COMMENT '订单编号',
  `user_id` STRING COMMENT '用户编号',
  `alipay_trade_no` STRING COMMENT '支付宝交易流水编号',
  `total_amount` decimal(16,2)  COMMENT '支付金额',
  `subject` STRING COMMENT '交易内容',
  `payment_type` STRING COMMENT '支付方式',
  `payment_time` STRING COMMENT '支付时间'
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.payment_info',
  'properties.bootstrap.servers' = 'hadoop100:9092,hadoop101:9092,hadoop102:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
  'canal-json.ignore-parse-errors'='true'
);

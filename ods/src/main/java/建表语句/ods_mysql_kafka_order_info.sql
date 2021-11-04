



drop table gma_ods.ods_mysql_kafka_order_info;

CREATE TABLE gma_ods.ods_mysql_kafka_order_info(
  `id` BIGINT COMMENT '编号',
  `consignee` STRING COMMENT '收货人',
  `consignee_tel` STRING COMMENT '收件人电话',
  `total_amount` decimal(10,2) COMMENT '总金额',
  `order_status` STRING COMMENT '订单状态',
  `user_id` BIGINT COMMENT '用户id',
  `payment_way` STRING COMMENT '付款方式',
  `delivery_address` STRING COMMENT '送货地址',
  `order_comment` STRING COMMENT '订单备注',
  `out_trade_no` STRING COMMENT '订单交易编号（第三方支付用)',
  `trade_body` STRING COMMENT '订单描述(第三方支付用)',
  `create_time` TIMESTAMP(3) COMMENT '创建时间',
  `operate_time` TIMESTAMP(3) COMMENT '操作时间',
  `expire_time` TIMESTAMP(3) COMMENT '失效时间',
  `tracking_no` STRING COMMENT '物流单编号',
  `parent_order_id` BIGINT COMMENT '父订单编号',
  `img_url` STRING COMMENT '图片路径',
  `province_id` int COMMENT '地区'
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.order_info',
  'properties.bootstrap.servers' = 'hadoop100:9092,hadoop101:9092,hadoop102:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
  'canal-json.ignore-parse-errors'='true'
);

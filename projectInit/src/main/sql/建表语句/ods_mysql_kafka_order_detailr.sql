

drop table gma_ods.ods_mysql_kafka_order_detail;

CREATE TABLE gma_ods.ods_mysql_kafka_order_detail(
  `id` BIGINT COMMENT '编号',
  `order_id` BIGINT COMMENT '订单编号',
  `sku_id` BIGINT COMMENT 'sku_id',
  `sku_name` STRING COMMENT 'sku名称（冗余)',
  `img_url` STRING COMMENT '图片名称（冗余)',
  `order_price` decimal(10,2)  COMMENT '购买价格(下单时sku价格）',
  `sku_num` STRING COMMENT '购买个数',
  `create_time` TIMESTAMP(3) COMMENT '创建时间'
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.order_detail',
  'properties.bootstrap.servers' = 'master:9092,node1:9092,node2:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
  'canal-json.ignore-parse-errors'='true'
);


drop table gma_ods.ods_mysql_kafka_sku_info;

CREATE TABLE gma_ods.ods_mysql_kafka_sku_info(
  `id` bigint COMMENT 'skuid(itemID)',
  `spu_id` bigint COMMENT 'spuid',
  `price` decimal(10,0)  COMMENT '价格',
  `sku_name` STRING COMMENT 'sku名称',
  `sku_desc` STRING COMMENT '商品规格描述',
  `weight` decimal(10,2)  COMMENT '重量',
  `tm_id` bigint COMMENT '品牌(冗余)',
  `category3_id` bigint COMMENT '三级分类id（冗余)',
  `sku_default_img` STRING COMMENT '默认显示图片(冗余)',
  `create_time`TIMESTAMP(3)  COMMENT '创建时间'
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.sku_info',
  'properties.bootstrap.servers' = 'master:9092,node1:9092,node2:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
  'canal-json.ignore-parse-errors'='true'
);


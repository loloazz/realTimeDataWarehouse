
1、dwd  支付明细表

1、用户编号
2、sku 编号
3、支付时间
4、付款方式
7、省份编号
5、支付金额   商品单价*购买的数量
6、商品的数量


drop table  gma_dwd.dwd_payment_info ;

CREATE TABLE gma_dwd.dwd_payment_info (
  user_id BIGINT COMMENT '用户id',
  sku_id BIGINT COMMENT 'sku_id',
  payment_time  STRING COMMENT '支付时间',
  payment_type STRING COMMENT '支付方式',
  province_id int COMMENT '省编号',
  sum_price decimal(10,2)  COMMENT '支付金额',
  sku_num BIGINT COMMENT '购买个数'
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma_dwd.dwd_payment_info',
  'properties.bootstrap.servers' = 'hadoop100:9092,hadoop101:9092,hadoop102:9092',
  'properties.group.id' = 'asdasasda',
  'format' = 'changelog-json'
);



---------------------------------------------------
-- 创建时间： 2021-11-04
-- 创建人：姚龙
-- 模型层次：dwd
-- 输入表： 订单表， 支付流水表
-- Flink SQL> desc ods_mysql_kafka_payment_info;  t2
-- root
--  |-- id: BIGINT
--  |-- out_trade_no: STRING
--  |-- order_id: STRING
--  |-- user_id: STRING
--  |-- alipay_trade_no: STRING
--  |-- total_amount: DECIMAL(16, 2)
--  |-- subject: STRING
--  |-- payment_type: STRING
--  |-- payment_time: STRING
--

-- 订单明细表，
-- Flink SQL> desc ods_mysql_kafka_order_info;   t1
-- root
--  |-- id: BIGINT
--  |-- consignee: STRING
--  |-- consignee_tel: STRING
--  |-- total_amount: DECIMAL(10, 2)
--  |-- order_status: STRING
--  |-- user_id: BIGINT
--  |-- payment_way: STRING
--  |-- delivery_address: STRING
--  |-- order_comment: STRING
--  |-- out_trade_no: STRING
--  |-- trade_body: STRING
--  |-- create_time: TIMESTAMP(3)
--  |-- operate_time: TIMESTAMP(3)
--  |-- expire_time: TIMESTAMP(3)
--  |-- tracking_no: STRING
--  |-- parent_order_id: BIGINT
--  |-- img_url: STRING
--  |-- province_id: INT


-- 输出表： 支付事实表
-- 代码逻辑; 取出支付数据
---------------------------------------------------
-- Flink SQL> desc ods_mysql_kafka_order_detail;   t3
-- root
--  |-- id: BIGINT
--  |-- order_id: BIGINT
--  |-- sku_id: BIGINT
--  |-- sku_name: STRING
--  |-- img_url: STRING
--  |-- order_price: DECIMAL(10, 2)
--  |-- sku_num: STRING
--  |-- create_time: TIMESTAMP(3)
--

--      `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
--      `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
--      `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
--      `sku_name` varchar(200) DEFAULT NULL COMMENT 'sku名称（冗余)',
--      `img_url` varchar(200) DEFAULT NULL COMMENT '图片名称（冗余)',
--      `order_price` decimal(10,2) DEFAULT NULL COMMENT '购买价格(下单时sku价格）',
--      `sku_num` varchar(200) DEFAULT NULL COMMENT '购买个数',
--      `create_time` datetime DEFAULT NULL COMMENT '创建时间',
--      PRIMARY KEY (`id`)

-- 1、用户编号
-- 2、sku 编号
-- 3、支付时间
-- 4、付款方式
-- 7、省份编号
-- 5、支付金额   商品单价*购买的数量
-- 6、商品的数量

insert into gma_dwd.dwd_payment_info

select
 cast(t2.user_id as bigint) as user_id
 ,t3.sku_id as sku_id
 ,t2.payment_time as payment_time
 ,t2.payment_type as payment_type
 ,t1.province_id as province_id
 ,cast(t3.sku_num as bigint) * cast(t3.order_price as decimal(10,2)) as pay_sumprice
 ,cast(t3.sku_num as bigint)as sku_num
from
gma_ods.ods_mysql_kafka_order_info  /*+ OPTIONS('scan.startup.mode'='earliest-offset') */ as t1

join gma_ods.ods_mysql_kafka_order_detail   /*+ OPTIONS('scan.startup.mode'='earliest-offset') */ as t3
on t1.id = cast(t3.order_id as bigint)
join  gma_ods.ods_mysql_kafka_payment_info  /*+ OPTIONS('scan.startup.mode'='earliest-offset') */ as t2
on  t1.id = cast(t2.order_id as bigint)



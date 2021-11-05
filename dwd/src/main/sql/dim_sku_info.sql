---------------------------------------------------
-- 创建时间： 2021-11-04
-- 创建人：姚龙
-- 模型层次：dim
-- 输入表： 物品信息表，三级分类表，二级分类表，一级分类表，品牌表
--     ods_mysql_kafka_base_category1   id              t1
--     ods_mysql_kafka_base_category2   category1_id    t2
--     ods_mysql_kafka_base_category3   category2_id    t3
--     ods_mysql_kafka_base_trademark   tim_id  `       t4`
--     ods_mysql_kafka_sku_info         tim_id          t5
-- 输出表： 商品维度表
--  `id` bigint COMMENT 'sk
--  `spu_id` bigint COMMENT
--  `price` decimal(10,0)
--  `sku_name` STRING
--  `sku_desc` STRING
--  `weight` decimal(10,2)
--  `sku_default_img` STRIN
--  `create_time`TIMESTAMP(
--   category3_name STRING
--   category2_name STRING
--   category1_name STRING
--   tm_name STRING COMMENT
-- 代码逻辑; 关联所有表
---------------------------------------------------

insert into gma_dim.dim_sku_info
select
   t5.id as id
  ,t5.spu_id as  spu_id
  ,t5.price as  price
  ,t5.sku_name as  sku_name
  ,t5.sku_desc as sku_desc
  ,t5.weight as weight
  ,t5.sku_default_img as  sku_default_img
  ,t5.create_time as  create_time
  ,t3.name as  category3_name
  ,t2.name as  category2_name
  ,t1.name as  category1_name
  ,t4.tm_name as   tm_name
from  ods_mysql_kafka_sku_info   /*+ OPTIONS('scan.startup.mode'='earliest-offset') */  as  t5
join  ods_mysql_kafka_base_category3   /*+ OPTIONS('scan.startup.mode'='earliest-offset') */ as t3
on  t3.id = t5.category3_id
join  ods_mysql_kafka_base_category2   /*+ OPTIONS('scan.startup.mode'='earliest-offset') */  as t2
on t3.category2_id =  t2.id
join  ods_mysql_kafka_base_category1   /*+ OPTIONS('scan.startup.mode'='earliest-offset') */ as t1
on   t2.category1_id = t1.id
join  ods_mysql_kafka_base_trademark  /*+ OPTIONS('scan.startup.mode'='earliest-offset') */ as t4
on t5.tm_id = cast(t4.tm_id as BIGINT)




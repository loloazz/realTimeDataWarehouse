
---------------------------------------------------
-- 创建时间： 2021-11-04
-- 创建人：姚龙
-- 模型层次：dim
-- 输入表： 省表，地区表
-- 输出表： 地区维度表
-- 代码逻辑： 关联省表和地区表构建地区维度表
---------------------------------------------------

--
-- CREATE TABLE gma_ods.ods_mysql_kafka_base_province(
--                                                       id BIGINT,
--                                                       name STRING,
--                                                       region_id BIGINT,
--                                                       area_code STRING
--

-- CREATE TABLE gma_ods.ods_mysql_kafka_base_region(
--                                                     id BIGINT,
--                                                     region_name STRING

-- id BIGINT,
-- name STRING,
-- area_code STRING,
-- region_name STRING,
-- PRIMARY KEY (id) NOT ENFORCED


insert  into gma_dim.dim_region_info

select
    t.id as id ,
    t.name as name,
    t.area_code as area_code,
    tt.region_name as region_name
from gma_ods.ods_mysql_kafka_base_province   /*+ OPTIONS('scan.startup.mode'='earliest-offset') */   as t
join  gma_ods.ods_mysql_kafka_base_region   /*+ OPTIONS('scan.startup.mode'='earliest-offset') */   as tt
on t.region_id=tt.id;


-- flink中创建地区维度表
-- 动态表    修改时  原来的MySQL也会改变
CREATE TABLE gma_dim.dim_region_info(
  id BIGINT,
  name STRING,
  area_code STRING,
  region_name STRING,
  PRIMARY KEY (id) NOT ENFORCED
) WITH (
 'connector' = 'jdbc',
 'url' = 'jdbc:mysql://hadoop100:3306/gma?useUnicode=true&characterEncoding=utf-8',
 'table-name' = 'dim_region_info',
 'username' = 'root',
 'password' ='123456'
);

-- mysql中创建接收表

CREATE TABLE `dim_region_info` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(20) DEFAULT NULL COMMENT '省名称',
  `area_code` varchar(20) DEFAULT NULL COMMENT '行政区位码',
  `region_name` varchar(20) DEFAULT NULL COMMENT '大区名',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- 创建mysql -cdc 表

--cdc  先做一次全量扫描，再增量监控binlog读取数据
-- mysql-cdc 只能用于读取数据

CREATE TABLE gma_dim.dim_region_info_cdc(
  id BIGINT,
  name STRING,
  area_code STRING,
  region_name STRING,
  PRIMARY KEY (id) NOT ENFORCED
) WITH (
'connector' = 'mysql-cdc',
 'hostname' = 'master',
 'port' = '3306',
 'username' = 'root',
 'password' = '123456',
 'database-name' = 'gma_dim',
 'table-name' = 'dim_region_info'
);
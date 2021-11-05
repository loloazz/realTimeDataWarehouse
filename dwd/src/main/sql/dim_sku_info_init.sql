CREATE TABLE gma_dim.dim_sku_info(
    `id` bigint COMMENT 'skuid(itemID)',
    `spu_id` bigint COMMENT 'spuid',
    `price` decimal(10,0)  COMMENT '价格',
    `sku_name` STRING COMMENT 'sku名称',
    `sku_desc` STRING COMMENT '商品规格描述',
    `weight` decimal(10,2)  COMMENT '重量',
    `sku_default_img` STRING COMMENT '默认显示图片(冗余)',
    `create_time`TIMESTAMP(3)  COMMENT '创建时间',
     category3_name STRING COMMENT '三级分类名',
     category2_name STRING  COMMENT'二级分类名',
     category1_name STRING  COMMENT '一级分类名',
     tm_name STRING COMMENT '品牌名称',
     PRIMARY KEY (id) NOT ENFORCED
) WITH (
 'connector' = 'jdbc',
 'url' = 'jdbc:mysql://hadoop100:3306/gma?useUnicode=true&characterEncoding=utf-8',
 'table-name' = 'dim_sku_info',
 'username' = 'root',
 'password' ='123456'
);


CREATE TABLE `dim_sku_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'skuid(itemID)',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spuid',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'sku名称',
  `sku_desc` varchar(2000) DEFAULT NULL COMMENT '商品规格描述',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '重量',
  `sku_default_img` varchar(200) DEFAULT NULL COMMENT '默认显示图片(冗余)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `category3_name` varchar(200) DEFAULT NULL COMMENT '三级分类名',
  `category2_name` varchar(200) DEFAULT NULL COMMENT '二级分类名',
  `category1_name` varchar(200) DEFAULT NULL COMMENT '一级分类名',
  `tm_name` varchar(200) DEFAULT NULL COMMENT '品牌名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商品维度表';



CREATE TABLE gma_dim.dim_sku_info_cdc(
`id` bigint COMMENT 'skuid(itemID)',
`spu_id` bigint COMMENT 'spuid',
`price` decimal(10,0)  COMMENT '价格',
`sku_name` STRING COMMENT 'sku名称',
`sku_desc` STRING COMMENT '商品规格描述',
`weight` decimal(10,2)  COMMENT '重量',
`sku_default_img` STRING COMMENT '默认显示图片(冗余)',
`create_time`TIMESTAMP(3)  COMMENT '创建时间',
 category3_name STRING COMMENT '三级分类名',
 category2_name STRING  COMMENT'二级分类名',
 category1_name STRING  COMMENT '一级分类名',
 tm_name STRING COMMENT '品牌名称',
  PRIMARY KEY (id) NOT ENFORCED
) WITH (
'connector' = 'mysql-cdc',
 'hostname' = 'master',
 'port' = '3306',
 'username' = 'root',
 'password' = '123456',
 'database-name' = 'gma_dim',
 'table-name' = 'dim_sku_info'
);


drop table gma_ods.ods_mysql_kafka_user_info;

CREATE TABLE gma_ods.ods_mysql_kafka_user_info(
  `id` bigint COMMENT '编号',
  `login_name` STRING COMMENT '用户名称',
  `nick_name` STRING COMMENT '用户昵称',
  `passwd` STRING COMMENT '用户密码',
  `name` STRING COMMENT '用户姓名',
  `phone_num` STRING COMMENT '手机号',
  `email` STRING COMMENT '邮箱',
  `head_img` STRING COMMENT '头像',
  `user_level` STRING COMMENT '用户级别',
  `birthday` DATE COMMENT '用户生日',
  `gender` STRING COMMENT '性别 M男,F女',
  `create_time` TIMESTAMP(3)  COMMENT '创建时间'
) WITH (
  'connector' = 'kafka',
  'topic' = 'gma.user_info',
  'properties.bootstrap.servers' = 'master:9092,node1:9092,node2:9092',
  'properties.group.id' = 'asdasd',
  'format' = 'canal-json',
   'canal-json.ignore-parse-errors'='true'
);

# 数据仓库 实时数仓

## 什么是数据仓库？
数据仓库：一个面向主题的、集成的、相对稳定的、反映历史变化的数据集合，用于支持管理决策

数据仓库是将多个数据源的数据经过ETL（Extract（抽取）、Transform（转换）、Load（加载））处理之后，按照一定的主题集成起来提供决策支持和联机分析应用的结构化数据环境

早期数据仓库构建主要指的是把企业的业务数据库如 ERP、CRM、SCM 等数据按照决策分析的要求建模并汇总到数据仓库引擎中，其应用以报表为主，目的是支持管理层和业务人员决策（中长期策略型决策）

随着业务和环境的发展，这两方面都在发生着剧烈变化。

随着IT技术走向互联网、移动化，数据源变得越来越丰富，在原来业务数据库的基础上出现了非结构化数据，比如网站 log，IoT 设备数据，APP 埋点数据等，这些数据量比以往结构化的数据大了几个量级，对 ETL 过程、存储都提出了更高的要求；

互联网的在线特性也将业务需求推向了实时化，随时根据当前客户行为而调整策略变得越来越常见，比如大促过程中库存管理，运营管理等（即既有中远期策略型，也有短期操作型）；同时公司业务互联网化之后导致同时服务的客户剧增，有些情况人工难以完全处理，这就需要机器自动决策。比如欺诈检测和用户审核。



## 实时数仓的应用场景
实时 OLAP 分析：OLAP 分析本身就是数仓领域重点解决的问题，基于公司大数据架构团队提供的基于 Flink 计算引擎的 stream sql 工具，Kafka 和 ddmq (滴滴自研)等消息中间件，druid 和 ClickHouse 等 OLAP 数据库，提升数仓的时效性能力，使其具有较优的实时数据分析能力。

实时数据看板：当日分钟级订单侧核心指标数据展示，增长类项目资源投入和收益实时效果展示等。

实时业务监控：大量核心业务指标需要具备实时监控能力，比如安全指标监控，财务指标监控，投诉进线指标监控等。

实时数据接口服务：由于各业务线之间存在很多业务壁垒，导致数仓开发很难熟悉公司内全部业务线，需要与各业务线相关部门在数据加工和数据获取方面进行协作，数仓通过提供实时数据接口服务的方式，向业务方提供数据支持。


# 架构图
![image](https://user-images.githubusercontent.com/63897378/140049926-e56a583e-6c0f-4f8b-990f-1f3fcabba06a.png)


最底层是收集层，这一层负责收集用户的实时数据，包括 Binlog、后端服务日志以及 IoT 数据，经过日志收集团队和 DB 收集团队的处理，数据将会被收集到 Kafka 中。这些数据不只是参与实时计算，也会参与离线计算。
收集层之上是存储层，这一层除了使用 Kafka 做消息通道之外，还会基于 HDFS 做状态数据存储以及基于 HBase 做维度数据的存储。
存储层之上是引擎层，包括 Storm 和 Flink。实时计算平台会在引擎层为用户提供一些框架的封装以及公共包和组件的支持。
在引擎层之上就是平台层了，平台层从数据、任务和资源三个视角去管理。
架构的最上层是应用层，包括了实时数仓、机器学习、数据同步以及事件驱动应用等。
传统数仓模型 为了更有效地组织和管理数据，数仓建设往往会进行数据分层，一般自下而上分为四层：ODS（操作数据层）、DWD（数据明细层）、DWS（汇总层）和应用层。即时查询主要通过 Presto、Hive 和 Spark 实现。



实时数仓模型 实时数仓的分层方式一般也遵守传统数据仓库模型，也分为了 ODS 操作数据集、DWD 明细层和 DWS 汇总层以及应用层。但实时数仓模型的处理的方式却和传统数仓有所差别，如明细层和汇总层的数据一般会放在 Kafka 上，维度数据一般考虑到性能问题则会放在 HBase 或者 Tair 等 KV 存储上，即席查询则可以使用 Flink 完成。


## 实时数仓和传统数仓的对比主要可以从四个方面考虑：

第一个是分层方式，离线数仓为了考虑到效率问题，一般会采取空间换时间的方式，层级划分会比较多；则实时数仓考虑到实时性问题，一般分层会比较少，另外也减少了中间流程出错的可能性。
第二个是事实数据存储方面，离线数仓会基于 HDFS，实时数仓则会基于消息队列（如 Kafka）。
第三个是维度数据存储，实时数仓会将数据放在 KV 存储上面。
第四个是数据加工过程，离线数仓一般以 Hive、Spark 等批处理为主，而实时数仓则是基于实时计算引擎如 Storm、Flink 等，以流处理为主。


## 总结 - 实时数仓的层级划分
总结下，实时数仓主要有两个要点。首先是分层设计上，一般也是参考离线数仓的设计，通常会分为ODS操作数据层、DWD明细层、DWS汇总层以及ADS应用层，可能还会分出一层DIM维度数据层。另外分层设计上也有不同的思路，比如可以将DWS和ADS归为DM数据集市层，网易严选就是这样设计的。

技术选型上，离线数仓一般依托HDFS或Hive构建，选择MR或Spark计算引擎；
实时数仓存储层更多是选择Kafka等消息引擎，通常明细层和汇总层都放在Kafka，计算层则多是选择Flink/Spark Streaming/Storm，这方面Flink更有优势，社区也更倾向于选择Flink。

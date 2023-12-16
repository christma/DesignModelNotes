

# Kafka分区副本重分配

## 1、为啥要进行分区重分配

1. 分区扩容了，需要重新分配
2. 需要新增副本
3. broker扩容，需要将原来的分区重新分配，达到负载均衡
4. Broker下线
5. 更换磁盘

创建副本的时候默认的副本配置？

default.replication.factor 创建副本因子，默认 1

offsets.topic.replication.factor 创建内部主题 __consumer_offsets 的默认副本因子，默认 3

transaction.state.log.replication.factor 创建内部主题,__transaction_state 的默认副本因子，默认 3

修改副本配置不能变更已有的Topic



## 2、如何进行分区重分配

1. 生成一个推荐配置脚本

2. 执行上面推荐的Json脚本

3. 验证执行是否成功并移除限流

   ！！！ --generate 副本数是通过assignment.head.replicas.size 获取的意思是 第一个分区的副本数量，正常情况下分区副本都会相同，分区数量是当前topic已存在的数量

## 3、如何更合理的进行分区副本重分配

## 4、如何使用LogiKM可视化方便的数据迁移

## 5、Topic创建，扩分区、冲分配等等的分区分配规则

## 6、分区分配规则的一个Bug造成的影响以及如何解决

## 7、如何最小成本实现副本扩索容


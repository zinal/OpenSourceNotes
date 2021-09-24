#! /bin/sh

PATH=$PATH:/usr/lpp/mmfs/hadoop/sbin
export PATH

mmhdfs config set hadoop-env.sh -k JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

mmhdfs config set core-site.xml -k fs.defaultFS=hdfs://cluster1

# mmhdfs config del hdfs-site.xml -k dfs.namenode.shared.edits.dir

mmhdfs config set hdfs-site.xml \
  -k dfs.blocksize=134217728 -k dfs.nameservices=cluster1 \
  -k dfs.ha.namenodes.cluster1=nn1,nn2 \
  -k dfs.namenode.rpc-address.cluster1.nn1=ipas-vm-0-107:8020 \
  -k dfs.namenode.http-address.cluster1.nn1=ipas-vm-0-107:50070 \
  -k dfs.namenode.rpc-address.cluster1.nn2=ipas-vm-0-108:8020 \
  -k dfs.namenode.http-address.cluster1.nn2=ipas-vm-0-108:50070 \
  -k dfs.client.failover.proxy.provider.cluster1=org.apache.hadoop.hdfs.server.namenode.ha.ConfiguredFailoverProxyProvider \
  -k dfs.namenode.shared.edits.dir=file:///fs0/HA-cluster1  \
  -k dfs.namenode.rpc-bind-host=0.0.0.0 \
  -k dfs.namenode.servicerpc-bind-host=0.0.0.0 \
  -k dfs.namenode.lifeline.rpc-bind-host=0.0.0.0 \
  -k dfs.namenode.http-bind-host=0.0.0.0

mmhdfs config set gpfs-site.xml -k gpfs.mnt.dir=/fs0 \
  -k gpfs.data.dir=cluster-data -k gpfs.storage.type=shared \
  -k gpfs.replica.enforced=gpfs

mmhdfs worker remove localhost

mmhdfs worker add ipas-vm-0-106,ipas-vm-0-107,ipas-vm-0-108

mmhdfs config set core-site.xml -k hadoop.proxyuser.hive.groups=*
mmhdfs config set core-site.xml -k hadoop.proxyuser.hive.hosts=*
mmhdfs config set core-site.xml -k hadoop.proxyuser.livy.hosts=*
mmhdfs config set core-site.xml -k hadoop.proxyuser.livy.groups=*
mmhdfs config set core-site.xml -k hadoop.proxyuser.hive.hosts=*
mmhdfs config set core-site.xml -k hadoop.proxyuser.hive.groups=*

mmhdfs config upload

/usr/lpp/mmfs/hadoop/bin/hdfs namenode -initializeSharedEdits

mmces service enable HDFS

mmhdfs hdfs-dn start

mmhdfs hdfs status



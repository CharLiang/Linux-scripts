#!/bin/bash

# awk 可以前段代码的结果作为后一段代码的输入
r=`ps ax|grep containerd-shim|grep run|awk '{print $9}'|awk -F '/' '{print $8}'`
if [ -z "$r" ];
then
r=`ps ax|grep containerd-shim|grep run|awk '{print $9}'|awk -F '/' '{print $7}'`
fi

docker exec -it $r bash
#docker exec -it c6379c762ff95d1aca0f5a4c6848e74602cacdf1ab55c704c978254305ee48a1 bash

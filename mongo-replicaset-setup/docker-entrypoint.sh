#!/bin/bash

set -e
echo -e "\033[1m Starting ReplicaSet configuration"

id=1
members=()
IFS=',' read -ra hosts <<< "${PRIMARY_MEMBER},${SECONDARY_MEMBERS}"
for host in "${hosts[@]}"; do
    members+=("{_id:${id},host:'${host}'}")
    ((id++))
done

members_js=`echo $(IFS=,; echo "${members[*]}")`
js="rs.initiate({_id:'${REPLICA_SET_ID}',members:[${members_js}]});"
mongo "${PRIMARY_MEMBER}/${DATABASE}" --eval "${js}"

echo -e "\033[1m Mongo is configured - stopping setup container"

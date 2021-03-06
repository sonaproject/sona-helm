#!/bin/bash

{{/*
Copyright 2018 The SONA Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/}}

set -x
sleep 5
export SONA_POD_IP=sona-service
httpUrl='curl -i --user onos:rocks -H "Content-Type:application/json" -d "{ \"nodes\": [
              {\"hostname\" : \"{{ .Values.labels.ovs.node_selector_value }}-$OVS_NODE_NAME\",
               \"type\" : \"{{ .Values.sona.node_type }}\",
               \"managementIp\" : \"$OVS_POD_IP\",
               \"dataIp\" : \"$OVS_POD_IP\"
{{ if .Values.sona.uplink_port }}
               ,\"uplinkPort\" : \"{{ .Values.sona.uplink_port }}\"
{{ end }}
              }]}" http://$SONA_POD_IP:8181/onos/openstacknode/configure 2>/dev/null | head -n 1 | cut -d$i" " -f2';
resp="$(eval $httpUrl)";
echo "resp:" "$resp"
if [ "$resp" -eq "201" ]; then
    echo "success"; exit 0;
else
    echo "failure"; exit 1;
fi
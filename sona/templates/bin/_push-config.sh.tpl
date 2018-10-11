#!/bin/sh
sleep 10
export SONA_POD_IP=sona-service
httpUrl='curl -i --user onos:rocks -H "Content-Type:application/json" -d "{ \"nodes\" : [ {
            \"hostname\" : \"controller\",
            \"type\" : \"CONTROLLER\",
            \"managementIp\" : \"127.0.0.1\",
            \"endpoint\" : \"10.1.1.1\",
            \"authentication\" : {
                    \"version\" : \"V3\",
                    \"port\" : 80,
                    \"protocol\" : \"HTTP\",
                    \"project\" : \"admin\",
                    \"username\" : \"admin\",
                    \"password\" : \"nova\",
                    \"perspective\" : \"PUBLIC\"
            } } ] }" http://$SONA_POD_IP:8181/onos/openstacknode/configure 2>/dev/null | head -n 1 | cut -d$i" " -f2';
resp="$(eval $httpUrl)";
echo "resp:" "$resp"
if [ "$resp" -eq "201" ]; then
    echo "success"; exit 1;
else
    echo "failure"; exit 1;
fi
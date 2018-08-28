# SONA-Helm

This chart installs [sona](http://wiki.onosproject.org/display/ONOS/SONA%3A+DC+Network+Virtualization).

## Prerequisite

Install Kubernetes
Install Helm Chart

## How to deploy

helm upgrade onos-sona sona-helm/ -i

## How to check

Once installed, you can access the application by executing a command as follows:

ssh -p 8101 karaf@sona-service



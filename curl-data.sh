#!/bin/bash

HTTP_IP=$(kubectl describe pod $(kubectl get pods | grep http-v |  awk '{ print $1 }') | grep "^IP:" | awk '{print $2}')

echo "*** Using HTTP IP $HTTP_IP"
echo "*** Sending data $1"

curl http://$HTTP_IP:8080 -H "Content-type: text/plain" -d "$1"

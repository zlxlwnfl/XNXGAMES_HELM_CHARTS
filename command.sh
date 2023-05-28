#!/bin/bash

efk_namespace="elastic-system"
istio_namespace="istio-system"
db_namespace="db-system"
values_file="values.yaml"

kubectl create -f https://download.elastic.co/downloads/eck/2.8.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/2.8.0/operator.yaml
kubectl port-forward service/my-kibana-kb-http 5601:5601 -n elastic-system

helm install efk .\charts\EFK -n elastic-system
#helm install elasticsearch ./charts/EFK/elasticsearch -n $efk_namespace -f $values_file
#helm install fluentd-bit ./charts/EFK/fluentd-bit -n $efk_namespace -f $values_file
#helm install kibana ./charts/EFK/kibana -n $efk_namespace -f $values_file
#helm install elasticsearch-curator ./charts/EFK/ElasticsearchCurator -n $efk_namespace -f $values_file

helm install istio .\charts\istio -n istio-system

helm install mysql .\charts\mysql -n db-system

#helm uninstall efk -n elastic-system --purge
#bin/elasticsearch-users useradd username -p password -r superuser

#username: test
#password: testtest

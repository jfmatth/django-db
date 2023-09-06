# need postgres://USER:PASSWORD@HOST:PORT/NAME
# kubectl get secret django.database -n postgres -o 'jsonpath={.data.password}' | base64 -
# k get svc/database -n postgres -o jsonpath={.status.loadBalancer.ingress[0].ip}

user=django
password=$(kubectl get secret django.database -n postgres -o "jsonpath={.data.password}" | base64 -d)
port=$(kubectl get svc/database -n postgres -o "jsonpath={.spec.ports[0].nodePort}")
ip=$(kubectl get svc/database -n postgres -o "jsonpath={.status.loadBalancer.ingress[0].ip}")
db=sampledb

echo postgres://$user:$password@$ip:$port/$db

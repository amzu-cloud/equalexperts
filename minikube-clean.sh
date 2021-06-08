
#!/bin/bash
status="host: Running";
echo
echo "Checking Minikube status.."
minikube_status=$(minikube status);

if [[ $minikube_status == *${status}* ]]; then
    echo
    echo "Deleting any existing deployments.."
    minikube tunnel -c
    kubectl delete deployment --all
    echo
    echo "Stopping Minikube.."
    minikube stop
else
    echo "Minikube already stopped."
fi
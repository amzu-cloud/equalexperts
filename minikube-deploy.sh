#!/bin/bash
# Pre-requirement:
#   1. Make sure that miniube > verison 1.9.2 is installed.
#   2. Make sure that minikube docker deamon has download access
#   2. Make sure that minikube tunnel is executed (in a separate terminal window) for starting 
#       the proxy service of minikube, without which the loadblaancer external IP will not be created.
run_script()
{
        # Step 1: This makes sure we reuse the docket deamon from minikube 
        echo
        echo "Fetching docker-env for minikube.."
        eval $(minikube docker-env)
        # Step 1: Build the docker image for the hello-flask application
        echo "Building docker image local/hello-flask.."
        docker build -t local/hello-flask:latest .

        # Step 2: Deploy the docker image created and start the load balancer
        echo
        echo "Deploy the docker build and enable load balancer.."
        kubectl apply -f ./service.yaml
        kubectl apply -f ./loadbalancer.yaml

        # Step5: Fetch the external Service


        IP=$(kubectl get services hello-world -o jsonpath="{.spec.clusterIP}")

        echo
        echo "Tryomg to open browser... If not you can open the URL http://${IP} in your favourite browser, to get the result.."

        open http://${IP}
}

status="host: Running";
echo
echo "Checking Minikube status.."
minikube_status=$(minikube status);

if [[ $minikube_status == *${status}* ]]; then
    echo "Minikube is running.."
    run_script;
else
    echo "Minikube is not running, please run minikube-run.sh in a separate terminal window.";
fi


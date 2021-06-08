# Minikube LB Deployment

This repository contains a solution for the below requirement:

Write a simple hello world application in any one of these languages: Python, Ruby, Go. Build the application within a Docker container and then load balance the application within minikube. You are not required to automate the installation of minikube on the host machine.

## Assumptions
- Minikube is installed in the server.
- User is running Mac OS (I do not have a windows setup yet)

## Pre-Requirements
- Minikube version 1.9.2 or Greater

## Deployment Steps
The deployment has 4 steps

- **Step 1** - Clone this Repository. Make sure that all the sh files have execute permission (use ```chmod +x *.sh```to change the permission to execute for all the three .sh files).
- **Step 2** - Open a temrinal window and run the below command. Since tunnel is a proxy it needs to be run. Note that you may have to enter your super user password for running the tunnel proxy to run. So look out for the prompt.

    ```
        ./minikube-start.sh
    ```
- **Step 3** - Open a New Terminal Windows and run the below command to deploy and run the example hello-world python flask application in a loadbalanced kubernetes service with minikube.
    ```
        ./minikube-deploy.sh
    ```
- **Step 4** - Clean up using the below command in a terminal window.
    ```
        ./minikube-clean.sh
    ```
## Conclusion
With proper minikube installation, this repositary will be able to start the minikube, start minikube tunnel, deploy the python file as docker image along with loadbalancer and then clean up after you have run the script.

If you have any further queries don't hesitate to contact me.

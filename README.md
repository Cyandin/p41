Particle 41 DevOps Exercise
---------------------------


  Section 1 - Pulling the Docker image and running it locally
  -----------------------------------------------------------

    To pull my image, run:

        $ docker pull cyandin/simple_time_service

    To launch the Docker container locally, run:

        $ sudo docker run -d -p 5000:5000 simple_time_service:latest

    My criteria for this working was curling 127.0.0.1:5000 and receiving the JSON structure.
        $ curl 127.0.0.1:5000
        {"ip":"172.17.0.1","timestamp":"2024-01-14T18:20:40"}


  Section 2 - Using Terraform to create an EKS cluster in AWS
  -----------------------------------------------------------
    
    Navigate to the "terraform" directory of this repo, and run the following:
        
        #Initialize Terraform, to download any module dependencies
        $ terraform init

        #Run a plan to be sure the apply will (probably) work
        $ terraform plan

        #Apply Terraform to build out the EKS environment we will run our microservice on
        $ terraform apply


  Section 3 - Setting up kubectl and deploying the Docker image to the newly created EKS cluster
  ----------------------------------------------------------------------------------------------


        #Create the kube config file you'll need to deploy the Docker image to EKS
        $ aws eks --region ca-central-1 update-kubeconfig --name my_eks_cluster
            Updated context arn:aws:eks:ca-central-1:881666630512:cluster/my_eks_cluster in /home/ec2-user/.kube/config

        #Navigate to the "apps" directory of this repo, and run the following:
        $ kubectl apply -f microservice.yml        
            deployment.apps/simple-time-service-deployment created
            service/simple-time-service-service created

        #Confirm the cluster is active
        $ aws eks describe-cluster --name my_eks_cluster --region ca-central-1 --query cluster.status
            "ACTIVE"

        #Check status of deployments
        $ kubectl get deployments
            NAME                             READY   UP-TO-DATE   AVAILABLE   AGE
            simple-time-service-deployment   3/3     3            3           27s

        #Check status of services
        $ kubectl get services
            NAME                          TYPE           CLUSTER-IP        EXTERNAL-IP                                                                 PORT(S)        AGE
            kubernetes                    ClusterIP      192.168.129.1     <none>                                                                      443/TCP        83m
            simple-time-service-service   LoadBalancer   192.168.129.174   a945e2ecca8f94f3da0a687124198156-789548696.ca-central-1.elb.amazonaws.com   80:31479/TCP   67s

        #Check status of pods
        $ kubectl get pods
            NAME                                             READY   STATUS    RESTARTS   AGE
            simple-time-service-deployment-5f87fbbbf-62vlm   1/1     Running   0          72s
            simple-time-service-deployment-5f87fbbbf-7dp5p   1/1     Running   0          72s
            simple-time-service-deployment-5f87fbbbf-txvqv   1/1     Running   0          72s

        #Check status of nodes
        $ kubectl get nodes
            NAME                                               STATUS   ROLES    AGE   VERSION
            ip-192-168-129-142.ca-central-1.compute.internal   Ready    <none>   79m   v1.28.5-eks-5e0fdde

        #Lastly, ensure you can curl the EKS cluster to receive the same result as when you ran the Docker image locally
            $ curl a945e2ecca8f94f3da0a687124198156-789548696.ca-central-1.elb.amazonaws.com
            {"ip":"192.168.129.142","timestamp":"2024-01-14T18:09:59"}


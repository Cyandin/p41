#############################
#Particle 41 DevOps Exercise#
#############################
#
#
#Task 1 - Minimalist Application Development / Docker / Kubernetes
#
#To pull my image, please run:
#
#docker pull cyandin/simple_time_service
#
#To launch the Docker container, please run:
#
#sudo docker run -d -p 5000:5000 simple_time_service:latest
#
#NOTE: My criteria for this working was curling 127.0.0.1:5000 and receiving the JSON structure.
#
#
#################
#USEFUL COMMANDS#
################
#
#[ec2-user@ip-172-31-28-66 terraform]$ aws eks describe-cluster --name my_eks_cluster --region ca-central-1 --query cluster.status
#"ACTIVE"
#[ec2-user@ip-172-31-28-66 terraform]$ kubectl get pods
#NAME                                             READY   STATUS             RESTARTS        AGE
#simple-time-service-deployment-5f87fbbbf-8x4d7   0/1     CrashLoopBackOff   6 (2m31s ago)   8m39s
#simple-time-service-deployment-5f87fbbbf-96qlw   0/1     CrashLoopBackOff   6 (2m35s ago)   8m39s
#simple-time-service-deployment-5f87fbbbf-rxdpl   0/1     CrashLoopBackOff   6 (2m32s ago)   8m39s
#[ec2-user@ip-172-31-28-66 terraform]$ kubectl get services
#NAME                          TYPE           CLUSTER-IP        EXTERNAL-IP                                                                  PORT(S)        AGE
#kubernetes                    ClusterIP      192.168.129.1     <none>                                                                       443/TCP        19m
#simple-time-service-service   LoadBalancer   192.168.129.228   a860960207bde4a2abd56fac363373b9-2119437183.ca-central-1.elb.amazonaws.com   80:31818/TCP   8m48s#
#
#
#
#Task 2 - Terraform: Create and Use a Module
#
#To run this module, please do the following:
#
#cd terraform
#terraform init
#terraform plan
#terraform apply
#
#NOTE: Even though the acceptance criteria states only running plan and apply, I don't see a way around running init. I hope this is ok!

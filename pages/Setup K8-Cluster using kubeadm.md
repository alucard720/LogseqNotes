# Setup docker.io & Kubernetes
- ### 1. Update System Packages [On Master & Worker Node]
  [](https://github.com/jaiswaladi246/DevOps_Shack_Ultimate_Pipeline_12_march/blob/main/PHASE-1/2.%20K8-Setup.md#1-update-system-packages-on-master--worker-node)
  
  ```
  sudo apt-get update
  ```
- ### 2. Install Docker[On Master & Worker Node]
  [](https://github.com/jaiswaladi246/DevOps_Shack_Ultimate_Pipeline_12_march/blob/main/PHASE-1/2.%20K8-Setup.md#2-install-dockeron-master--worker-node)
  
  ```
  sudo apt install docker.io -y
  sudo chmod 666 /var/run/docker.sock
  sudo groupadd docker
  sudo usermod -aG docker $USER
  newgrp docker
  ```
- ### 3. Install Required Dependencies for Kubernetes[On Master & Worker Node]
  [](https://github.com/jaiswaladi246/DevOps_Shack_Ultimate_Pipeline_12_march/blob/main/PHASE-1/2.%20K8-Setup.md#3-install-required-dependencies-for-kuberneteson-master--worker-node)
  
  ```
  sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
  sudo mkdir -p -m 755 /etc/apt/keyrings
  ```
- ### 4. Add Kubernetes Repository and GPG Key[On Master & Worker Node]
  [](https://github.com/jaiswaladi246/DevOps_Shack_Ultimate_Pipeline_12_march/blob/main/PHASE-1/2.%20K8-Setup.md#4-add-kubernetes-repository-and-gpg-keyon-master--worker-node)
  
  ```
  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
  ```
- ### 5. Update Package List[On Master & Worker Node]
  [](https://github.com/jaiswaladi246/DevOps_Shack_Ultimate_Pipeline_12_march/blob/main/PHASE-1/2.%20K8-Setup.md#5-update-package-liston-master--worker-node)
  
  ```
  sudo apt update
  ```
- ### 6. Install Kubernetes Components[On Master & Worker Node]
  [](https://github.com/jaiswaladi246/DevOps_Shack_Ultimate_Pipeline_12_march/blob/main/PHASE-1/2.%20K8-Setup.md#6-install-kubernetes-componentson-master--worker-node)
  
  ```
  sudo apt install -y kubeadm=1.28.1-1.1 kubelet=1.28.1-1.1 kubectl=1.28.1-1.1
  ```
- ### 7. Initialize Kubernetes Master Node [On MasterNode]
  [](https://github.com/jaiswaladi246/DevOps_Shack_Ultimate_Pipeline_12_march/blob/main/PHASE-1/2.%20K8-Setup.md#7-initialize-kubernetes-master-node-on-masternode)
  
  ```
  sudo kubeadm init --pod-network-cidr=10.244.0.0/16
  ```
- ### 8. Configure Kubernetes Cluster [On MasterNode]
  [](https://github.com/jaiswaladi246/DevOps_Shack_Ultimate_Pipeline_12_march/blob/main/PHASE-1/2.%20K8-Setup.md#8-configure-kubernetes-cluster-on-masternode)
  
  ```
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  ```
- ### 9. Deploy Networking Solution (Calico) [On MasterNode]
  [](https://github.com/jaiswaladi246/DevOps_Shack_Ultimate_Pipeline_12_march/blob/main/PHASE-1/2.%20K8-Setup.md#9-deploy-networking-solution-calico-on-masternode)
  
  ```
  kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
  ```
- ### 10. Deploy Ingress Controller (NGINX) [On MasterNode]
  [](https://github.com/jaiswaladi246/DevOps_Shack_Ultimate_Pipeline_12_march/blob/main/PHASE-1/2.%20K8-Setup.md#10-deploy-ingress-controller-nginx-on-masternode)
  
  ```
  kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.49.0/deploy/static/provider/baremetal/deploy.yaml
  ```
-
# Kubernetes Setup
#On Master and Worker
sudo apt-get update -y
sudo apt-get install docker.io -y
sudo service docker restart
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key-gpg/ apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" ›/etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt install kubeadm=1.20.0-00 kubect1=1.20.0-00 kubelet=1.20.0-00 -y
- # Step2:
  #On Master node:
  kubeadm init --pod-network-cidr=192.168.0.0/16
- # Step3:
- # On Master node:
  mkdir -p $HOME/ . kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/. kube/config
  sudo chown $(id -u):$(id -g) $Н0МЕ/. kube/config
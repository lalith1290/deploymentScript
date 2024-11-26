## Install Docker
sudo wget https://raw.githubusercontent.com/lalith1290/deploymentScript/refs/heads/main/installDocker.sh -P /tmp
sudo chmod 755 /tmp/installDocker.sh
sudo bash /tmp/installDocker.sh
sudo systemctl restart docker.service

## Install CRI-Docker
sudo wget https://raw.githubusercontent.com/lalith1290/deploymentScript/refs/heads/main/installCRIDocker.sh -P /tmp
sudo chmod 755 /tmp/installCRIDocker.sh
sudo bash /tmp/installCRIDocker.sh
sudo systemctl restart cri-docker.service

## Install kubernetes


sudo wget https://raw.githubusercontent.com/lalith1290/deploymentScript/refs/heads/main/installKubernetes.sh -P /tmp
sudo chmod 755 /tmp/installKubernetes.sh
sudo bash /tmp/installKubernetes.sh


## Initialize kubernetes Master Node
 
   sudo kubeadm init --cri-socket unix:///var/run/cri-dockerd.sock --ignore-preflight-errors=all


   sudo mkdir -p $HOME/.kube
   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   sudo chown $(id -u):$(id -g) $HOME/.kube/config


   ## install networking driver -- Weave/flannel/canal/calico etc... 


   ## below installs calico networking driver 
    
   kubectl apply -f https://raw.githubusercontent.com/lalith1290/deploymentScript/refs/heads/main/calicoNetworkDriver.yaml

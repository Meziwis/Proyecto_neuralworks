# Add the bitnami chart repository to helm (if you have not done this already)
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

kubectl create namespace monitoring
helm install --namespace monitoring -f prometheus_helm.yaml prometheus-chart bitnami/kube-prometheus
docker build -t tf-server:1.0.0 -f Dockerfile .
kubectl create namespace tfmodels
kubectl apply -f tf-serving.yaml
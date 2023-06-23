# Model Serving with Prometheus and Grafana

This folder contains the necessary files for setting up monitoring with Prometheus and Grafana while serving your TensorFlow model. Prometheus is used for collecting and storing metrics, while Grafana provides a visualization dashboard for monitoring and analyzing the metrics.

## Folder Structure

- **graphana_create.sh**: This script installs Grafana using the Helm package manager. It deploys the Grafana chart with the specified configuration.

- **prometheus_create.sh**: This script installs Prometheus using the Helm package manager. It deploys the Prometheus chart with the specified configuration.

- **prometheus_helm.yaml**: This YAML file contains the configuration options for installing Prometheus using Helm. It specifies the chart version, release name, and other settings.


## Prerequisites

Before proceeding with the installation, ensure that you have the following prerequisites:

- Helm: Make sure you have Helm installed on your system. Helm is a package manager for Kubernetes that simplifies the deployment and management of applications.

## Installation

Follow the steps below to install Prometheus and Grafana for monitoring the TensorFlow model:

1. Install Prometheus:

   Run the following command:

   ```bash
   sh prometheus_create.sh
    ```

    You should get a message telling you under which DNS from within the cluster Prometheus can be accessed.
    
        ```bash
        Prometheus can be accessed via port "9090" on the following DNS name from within your cluster:
        prometheus-chart-kube-prom-prometheus.monitoring.svc.cluster.local

        # It follows that:
        # service name: prometheus-chart-kube-prom-prometheus
        # namespace: monitoring
        ```
   To access Prometheus from outside the cluster, execute the following command:

    ```bash
    kubectl -n monitoring port-forward svc/<service name> 9090:9090
    ```
    Replace <service name> with the actual service name obtained from the panel above. After a few minutes, when all Prometheus components are installed, you can access the Prometheus UI at http://127.0.0.1:9090.

    Once you have accessed the Prometheus UI, you can execute the query tensorflow:serving:request_count to retrieve the metrics related to the number of API calls made to the TensorFlow model service. By making several API calls, you can observe how the graph changes in response to the increased activity.

    Note: Ensure that the port forwarding command is running in the background to maintain access to the Prometheus UI.

2. Install Grafana:

    Run the following command:
    
    ```bash
    sh graphana_create.sh
     ```

     After running the shell script, you will see the following output:
    
     ```bash
    1. Get the application URL by running these commands:
    echo "Browse to http://127.0.0.1:8080"
    kubectl port-forward svc/grafana-chart 8080:3000
    2. Get the admin credentials:
    echo "User: admin"
    echo "Password: $(kubectl get secret grafana-chart-admin - namespace monitoring -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 -d)"
    ```

    To access Grafana from outside the cluster, execute the following command:

    ```bash
    kubectl -n monitoring port-forward svc/<service name> 8080:3000
    ```
    Replace <service name> with the actual service name obtained from the panel above. After a few minutes, when all Grafana components are installed, you can access the Grafana UI at http://localhost:8080.

    Once you have accessed the Grafana UI, you can log in using the credentials obtained from the panel above. After logging in, you can add Prometheus as a data source by clicking on the gear icon on the left panel and selecting Data Sources. Then, click on Add data source and select Prometheus. Enter the URL of the Prometheus server (http://prometheus-chart-kube-prom-prometheus.monitoring.svc.cluster.local:9090) and click Save & Test. If the connection is successful, you should see a green notification at the top of the page.

    For more information on how to use Grafana, refer to the [official documentation](https://grafana.com/docs/grafana/latest/guides/getting_started/).




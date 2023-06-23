# Project Setup

This document provides instructions on setting up the project environment for both the local experimental part and the deployment part. It includes separate sections for each aspect.

## Local Experimental Setup

### Prerequisites

- Python (version 3.6 or above)
- pip (package installer for Python)
- Jupyter Notebook

### Setup Steps

1. Clone the repository:

   ```shell
   git clone https://github.com/your-username/your-project.git
   cd your-project
   ```
2. Create a virtual environment (optional but recommended):

   ```shell
   python3 -m venv venv
   source venv/bin/activate
   ```
3. Install the required dependencies:

   ```shell
    pip install -r requirements.txt
    ```
4. Start Jupyter Notebook:
   
   ```shell
   jupyter notebook
   ```
5. Open the desired notebook from the `notebooks` directory and run it.
   

**Note for Deep Learning Models**: The notebooks related to deep learning models, such as the DNN implemented in TensorFlow, require TensorFlow to be installed. Please refer to the official TensorFlow installation guide at [https://www.tensorflow.org/install](https://www.tensorflow.org/install) to choose your preferred installation method and install the appropriate version of TensorFlow based on your system and requirements.

For more specific information on using the balanced models and their training process, please refer to the [README.md](./notebooks/balanced/README.md) file in the `notebooks/balanced` directory.



## Deployment Setup

### Prerequisites

- Docker
- Kubernetes (Minikube is recommended for local deployment)

### Setup Steps

1. Follow the instructions in the [README.md](./docker/README.md) file to build the Docker image and deploy the model container.

2. Follow the instructions in the [README.md](./serving/README.md) file to deploy the model container using Kubernetes.





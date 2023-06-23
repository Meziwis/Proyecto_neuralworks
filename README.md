# Flight Data Analysis and Prediction

This repository contains the code and resources for analyzing flight data passing through Santiago, Chile, and building a predictive model using machine learning techniques. The project involves data preprocessing, model training, deployment, and monitoring.

## Table of Contents
- [Flight Data Analysis and Prediction](#flight-data-analysis-and-prediction)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Data](#data)
  - [Project Structure](#project-structure)
  - [Setup and Installation](#setup-and-installation)
  - [Notebooks](#notebooks)
  - [Detailed explanation](#detailed-explanation)
  


## Introduction

Flight Data Analysis and Prediction is a project aimed at analyzing flight data to gain insights and build a predictive model. The dataset consists of flights passing through Santiago, Chile, and is provided in CSV format. The project utilizes Jupyter Notebook and the powerful pandas library for data analysis.

The analysis pipeline involves several steps. First, the raw flight data is preprocessed, including feature extraction, balancing, scaling, and augmentation, to create a reliable and representative dataset. Various techniques are applied to extract relevant features and ensure high-quality input for the machine learning models.

Multiple machine learning models are trained on the preprocessed data. Models performance is evaluated using standard metrics such as F1 score, accuracy, recall, PR curve, and ROC curve. The selected model, which demonstrates superior performance, is further serialized and deployed as an API for real-time predictions.

The deployed model is served using TensorFlow Serve and Docker. It is integrated as a pod under a load balancer in Kubernetes, providing scalable and reliable access to the predictive capabilities. Prometheus, a monitoring and alerting toolkit, is utilized to collect metrics on the model's usage and performance.

To gain insights and visualize the model's behavior, Grafana is used to create a comprehensive monitoring dashboard. This dashboard presents visualizations and statistics related to the model's performance and usage.


## Data

The flight data used in this project is sourced from flights passing through Santiago, Chile. It is provided in CSV format and is processed using the pandas library. More details about the dataset and its structure can be found in the [data/README.md](./data/README.md) file.

## Project Structure

The repository is organized into the following directories:

- **data**: Contains the flight data in CSV format and any related documentation.
- **encoders**: Directory for encoder classes or scripts related to feature encoding or preprocessing.
- **notebooks**: Contains Jupyter Notebooks for data analysis, preprocessing, and model training. It includes separate subdirectories for balanced and non-balanced notebooks.
- **serving**: Includes files for model serving and deployment.
    - **models**: Stores serialized models or model-related files.

## Setup and Installation

To set up the project locally, please follow the instructions in the [setup.md](./setup.md) file. It provides step-by-step guidance on installing the required dependencies and configuring the environment.

## Notebooks

Detailed instructions on how to use the project components can be found in the [README.md](./notebooks/README.md) file. It provides an overview of each notebook, their purpose, and how to run them.

## Detailed explanation

For a detailed (spanish) explanation of the project, please refer to the [documentation](./documentation.md) file.


# Model Training and Evaluation

This folder contains the code and artifacts related to the training and evaluation of machine learning models. Here's an overview of the contents:


## Setup

Before running the notebooks in this folder, make sure you have installed the required dependencies. You can do this by following these steps:

1. Create a virtual environment (optional but recommended).
2. Activate the virtual environment.
3. Install the necessary packages by running the following command:

```bash
pip install -r requirements.txt
```

**__Note:__** This will allow you to run the notebooks,except the ones related to tensorflow, for tensorflow installation please follow the instructions in https://www.tensorflow.org/install.



## `balanced` Folder

- `Best_model`: This directory contains the serialized version of the best model found during the training process. It represents the trained model with the highest performance.
- `checkpoints`: This directory stores checkpoints of the trained models at different stages during the training process. These checkpoints are used for resuming training or performing model evaluation.
- `logs`: This directory contains the TensorBoard logs generated during the model training. TensorBoard provides visualization and monitoring capabilities for the training process.
- `model-training-balanced.ipynb`: This Jupyter Notebook contains the code for training the machine learning models on the balanced dataset. It includes data preprocessing, model configuration, training loop, and evaluation.

## `nonbalanced` Folder

- `checkpoints`: Similar to the `balanced` folder, this directory stores checkpoints of the trained models for the nonbalanced dataset.
- `logs`: This directory contains the TensorBoard logs generated during the training process for the nonbalanced dataset.
- `model-training-nonbalanced.ipynb`: This Jupyter Notebook contains the code for training the machine learning models on the nonbalanced dataset. It follows a similar structure as the `model-training-balanced.ipynb` notebook.

## `clasical models.ipynb`

This Jupyter Notebook focuses on the implementation and evaluation of classical machine learning models. It includes data preprocessing, model training, and evaluation using various classical ML algorithms.

## `data-exploration.ipynb`

This Jupyter Notebook is dedicated to data exploration and analysis. It provides insights into the dataset, performs statistical analysis, and visualizes important features.

## `data-preparation.ipynb`

The `data-preparation.ipynb` notebook focuses on data preprocessing tasks. It covers handling missing values, feature encoding, scaling, and other necessary transformations to prepare the dataset for model training.

## `scaler.pkl`

The `scaler.pkl` file contains the serialized version of the data scaler used during preprocessing. This scaler can be loaded and applied to new data to ensure consistent scaling.

## `xgboost_model.bin`

The `xgboost_model.bin` file represents the serialized version of the trained XGBoost model. It can be loaded and used for predictions without retraining.

Note: Due to their large size, the checkpoint files are not included in the final repository. However, the training code is provided to reproduce the models and generate new checkpoints if needed.

Please refer to the individual notebooks and directories for more detailed information on model training, evaluation, and usage.

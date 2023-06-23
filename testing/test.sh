#!/bin/bash

# Activate the conda environment
source activate tf

# Run the Python script in a loop for 45 seconds
for i in {1..45}
do
    python test_server.py
    sleep 1
done

# Deactivate the conda environment
conda deactivate
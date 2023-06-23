# Use an official Python runtime as a parent image
FROM tensorflow/serving


# Copy the current directory contents into the container at /app
COPY models /models

# Expose the ports that the model server will listen on
EXPOSE 8500
#EXPOSE 7000

# Set the environment variables for the model server
#ENV MODEL_NAME=bm
#ENV MODEL_BASE_PATH=/models/

# Start the TensorFlow model server
#CMD tensorflow_model_server --port=8500 --rest_api_port=7000 --model_name=${MODEL_NAME} --model_base_path=${MODEL_BASE_PATH}
#!/bin/bash

# Start the Docker container
docker run -d --name my-container my-image

# Wait for the application to be ready
sleep 5

# Run the tests against the containerized application
docker exec my-container pytest

# Cleanup: stop and remove the container
docker stop my-container
docker rm my-container
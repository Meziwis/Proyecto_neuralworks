# Testing Folder

This folder contains the necessary files for testing the application.

## Dockerfile

The Dockerfile is used to build a Docker image for testing the application. It sets up a Python 3.9 environment, installs the required dependencies from the `requirements.txt` file, and copies the test files into the image. The entrypoint command runs the `test_server.py` script.

To build the Docker image, use the following command:

   ```bash
   docker build -t my-image .
   ```


## build.sh

The `build.sh` script is a convenience script that builds the Docker image using the Dockerfile. It tags the image as `my-image`.

To build the Docker image, execute the following command:

```bash
chmod +x build.sh
./build.sh
```


## test.sh

The `test.sh` script is responsible for running the tests against the deployed application. You can customize this script based on your testing requirements.



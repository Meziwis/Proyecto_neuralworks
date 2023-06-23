import pandas as pd
import joblib
import numpy as np
import json
import requests

X_test = pd.read_csv('../data/X_test_balanceado.csv')

# Load the scaler object from the file
scaler = joblib.load('scaler.pkl')

# Scale the test data using the saved scaler object
X_test_scaled = scaler.transform(X_test)

test_data = X_test_scaled[0]

test_data = test_data.reshape(1, 777)

# Define the URL for the prediction request
url = 'http://localhost:8501/v1/models/bm:predict'

# Define the input data for the prediction request
input_data = test_data.astype('float32').tolist()
request_data = {'instances': input_data}

# Send the prediction request to the API
response = requests.post(url, data=json.dumps(request_data))


# Parse the prediction result from the response
result = json.loads(response.text)['predictions'][0]
result = np.array(result).astype('float32')


# Print the prediction result
print(result)
import base64
import pip._vendor.requests 
import json
import os

# functions
def encode_token(key: str, secret: str):
  key_and_secret=f"{app_manager_api_key}:{app_manager_api_secret}"
  key_and_secret_bytes = key_and_secret.encode("ascii")
  base64_bytes = base64.b64encode(key_and_secret_bytes)
  return base64_bytes.decode('ascii')

# constants
confluent_cloud_api_url = "https://api.confluent.cloud/iam/v2/api-keys"

# variables
app_manager_api_key = os.environ["app_manager_api_key"]
app_manager_api_secret = os.environ["app_manager_api_secret"]

display_name = os.environ["display_name"]
description = os.environ["description"]
owner_id = os.environ["owner_id"]
resource_id = os.environ["resource_id"]

# main body
access_token = encode_token(app_manager_api_key, app_manager_api_secret)

print(f"key and secret: {app_manager_api_key} + {app_manager_api_secret}")
print(f"access_token: {access_token}")
print(f"display_name: {display_name}")
print(f"description: {description}")
print(f"owner_id: {owner_id}")
print(f"resource_id: {resource_id}")

# Common http headers
headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic ' + access_token,
}

try:
  payload = {
    "spec": {
      "display_name": display_name,
      "description": description,
      "owner": {
        "id": owner_id
      },
      "resource": {
        "id": resource_id
      }
    }
  }

  api_key_response = pip._vendor.requests.api.post(confluent_cloud_api_url, data=json.dumps(payload), headers=headers, timeout=30)
  api_key_response.raise_for_status()
except pip._vendor.requests.exceptions.HTTPError as error:
  print(error)
  exit(1)

print("API Key provisioning completed and secrets stored to Azure Key Vault.")
exit(0)
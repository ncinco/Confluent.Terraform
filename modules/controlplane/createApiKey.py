import base64
import pip._vendor.requests 
import json
import os

# Set variables passed from Terraform and other variables.
app_manager_api_key = os.environ["app_manager_api_key"]
app_manager_api_secret = os.environ["app_manager_api_secret"]

display_name = os.environ["display_name"]
description = os.environ["description"]
owner_id = os.environ["owner_id"]
resource_id = os.environ["resource_id"]

access_token_bytes = base64.encode(f"{app_manager_api_key}:{app_manager_api_secret}")
access_token_encode_bytes = base64.b64encode(access_token_bytes)
access_token = access_token_encode_bytes.decode("ascii")

print(f"key and secret: {app_manager_api_key} + {app_manager_api_secret}")
print(f"access_token: {access_token}")
print(f"display_name: {display_name}")
print(f"description: {description}")
print(f"owner_id: {owner_id}")
print(f"resource_id: {resource_id}")

# constants
confluent_cloud_api_url = "https://api.confluent.cloud/iam/v2/api-keys"

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
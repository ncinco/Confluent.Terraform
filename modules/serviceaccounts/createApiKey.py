import base64
import pip._vendor.requests 
import json
import os

from azure.keyvault.secrets import SecretClient
from azure.identity import ClientSecretCredential

# constants
confluent_cloud_api_url = "https://api.confluent.cloud/iam/v2/api-keys"
azure_key_vault_uri     = "https://confluentcloudkeyvault.vault.azure.net/"

# variables
app_manager_api_key     = os.environ["app_manager_api_key"]
app_manager_api_secret  = os.environ["app_manager_api_secret"]

azure_tenant_id         = os.environ["azure_tenant_id"]
azure_client_id         = os.environ["azure_client_id"]
azure_client_secret     = os.environ["azure_client_secret"]

display_name            = os.environ["display_name"]
description             = os.environ["description"]
owner_id                = os.environ["owner_id"]
resource_id             = os.environ["resource_id"]

# begin: functions
def encode_token(key: str, secret: str) -> str:
  key_and_secret=f"{app_manager_api_key}:{app_manager_api_secret}"
  key_and_secret_bytes = key_and_secret.encode("ascii")
  base64_bytes = base64.b64encode(key_and_secret_bytes)
  return base64_bytes.decode('ascii')
# end: functions

# main body
access_token = encode_token(app_manager_api_key, app_manager_api_secret)

# Common http headers
headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic ' + access_token,
}

# create new confluent api key
try:
  api_key_payload = {
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

  api_key_response = pip._vendor.requests.api.post(confluent_cloud_api_url, data=json.dumps(api_key_payload), headers=headers, timeout=30)
  api_key_response.raise_for_status()
except pip._vendor.requests.exceptions.HTTPError as error:
  print(error)
  exit(1)

# extract confluent api key details
api_key_response_json = api_key_response.json()
api_key_id = api_key_response_json.get("id")
api_key_secret = api_key_response_json.get("spec").get("secret")

credential = ClientSecretCredential(azure_tenant_id, azure_client_id, azure_client_secret)
secret_client = SecretClient(vault_url=azure_key_vault_uri, credential=credential)
secret_client.set_secret(api_key_id, api_key_secret)

print("API Key provisioning completed and secrets stored to Azure Key Vault.")
exit(0)
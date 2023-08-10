#import requests
import pip._vendor.requests 

import json

# Set variables passed from Terraform and other variables.
# access_token = os.environ["access_token"]
# display_name = os.environ["display_name"]
# description = os.environ["description"]
# owner_id = os.environ["owner_id"]
# resource_id = os.environ["resource_id"]

access_token = "QlBYV0M1RzcySkJFR0JBMjoxMC9sWFpWMjNOR244UVFoNGdBOUdQOEJ5Q1RVNUN4ZEUybE95dmYxd2YrVTRYYktuekRBbFAxSjQ4bUxGc0I3"
display_name = "trusted.api-key.cloud-cluster-admin"
description = "trusted.api-key.cloud-cluster-admin"
owner_id = "sa-156m83"
resource_id = "lkc-r2wydp"


# constants
confluent_cloud_api_url = "https://api.confluent.cloud/iam/v2/api-keys"

# Common http headers
headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + access_token,
}

try:
  payload = {
    'spec': {
      'display_name': display_name,
      'description': description,
      'owner': {
        'id': owner_id
      },
      'resource': {
        'id': resource_id
      }
    }
  }

  api_key_response = pip._vendor.requests.api.post(confluent_cloud_api_url, data=json.dumps(payload), headers=headers, timeout=30)
  print(api_key_response.json());

except pip._vendor.requests.exceptions.HTTPError as error:
  print(error)
  exit(1)

print("API Key provisioning completed and secrets stored to Azure Key Vault.")
exit(0)

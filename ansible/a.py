import sys
import inspect

sys.path.append('../python_libs')

import six
import googleapiclient.discovery
from six.moves import input
import json

compute = googleapiclient.discovery.build('compute', 'v1')

result = compute.instances().list(filter="name=reddit-db", project='fluted-elixir-234916', zone='europe-west1-b').execute()
a = result['items'] if 'items' in result else None
for f in a:
    print(f['name'])
sys.exit(7)
appIp = a[0]['networkInterfaces'][0]['accessConfigs'][0]['natIP']
dbIp = a[1]['networkInterfaces'][0]['accessConfigs'][0]['natIP']
dbInt = a[1]['networkInterfaces'][0]['networkIP']


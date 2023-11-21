# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`

from firebase_functions import https_fn
from firebase_admin import initialize_app
from firebase_admin import credentials
from firebase_admin import db
import sys
import json
import requests


initialize_app()



@https_fn.on_request()
def on_request_example(req: https_fn.Request) -> https_fn.Response:
    return https_fn.Response("Hello world!")

@https_fn.on_call()
def on_call_dbsnap(req: https_fn.Request):
    ref = db.reference('server/ads')
    headers = {'Accept': 'application/json'}
    response = requests.get('https://jobstream.api.jobtechdev.se/snapshot?location-concept-id=p8Mv_377_bxp', headers = headers)
    response.raise_for_status()
    list_of_ads=json.loads(response.content.decode('utf8'))
    ref.set(list_of_ads)
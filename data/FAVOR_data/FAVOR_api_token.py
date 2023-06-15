import os
import sys
import datetime

api_FILE = os.getenv('HOME') + '/.ssh/dataverse.harvard.edu-API-token'
expiration_date = datetime.date.fromisoformat('2024-06-01')  # expiration of the FAVOR API token

def get_token():
    if os.path.isfile(api_FILE):
        with open(api_FILE, "r") as api_file:
            for line in api_file:
                break
            api_token = line.strip()
        expired_check()
        return api_token
    else:
        return 'not-set'

def get_token_bash():
    if os.path.isfile(api_FILE):
        expired_check()
        return '$(cat ' + api_FILE + ')'
    else:
        return '$(echo not-set)'

def get_token_file():
    return api_FILE

def is_expired():
    if datetime.date.today() >= expiration_date:
        return True
    else:
        return False

def expired_check():
    if is_expired():
        print('Warning: FAVOR API token expired ' + str(expiration_date), file=sys.stderr)


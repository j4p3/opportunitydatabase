#STARTUP INSTITUTE ODB
*Semi-public job/opportunity board for SI alumni.*

##SETUP

1. create settings.rb file in root directory with format:
    FACEBOOK_KEY=[value]
    FACEBOOK_SECRET=[value]
2. bundle install
3. rake db:migrate
4. rake import (loader script that seeds db with .csv downloaded from gdoc)
5. contact me for FB credentials from step 1 or [create get credentials from your own sandbox application](https://developers.facebook.com/apps)

##NEEDS

* error handling - around everything. Validations, auth, forms
* better importer script - so that salaries from .csvs actually get entered as integers
* design - preferably featuring pictures of the late ODB
* better filtering mechanism - currently just matches, no search
* better data entry - dropdowns to enforce column consistency
* mailserver and subscription mechanism
* whatever else you'd like to throw in here

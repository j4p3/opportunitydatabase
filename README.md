#STARTUP INSTITUTE ODB
*Semi-public job/opportunity board for SI alumni.*

##SETUP

1 bundle install
2 rake db:migrate
3 rake import (the shitty loader script that seeds db with .csv downloaded from gdoc)
4 contact me for FB credentials or [create get credentials from your own sandbox application](https://developers.facebook.com/apps)
5 set FACEBOOK_KEY AND FACEBOOK_SECRET in shell.

##NEEDS

* error handling - around everything. Validations, auth, forms
* better importer script - so that salaries from .csvs actually get entered as integers
* design - preferably featuring pictures of the late ODB
* better filtering mechanism - currently just matches, no search
* better data entry - dropdowns to enforce column consistency
* mailserver and subscription mechanism
* whatever else you'd like to throw in here

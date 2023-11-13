# This program will keep a local database updated with ads from the JobStream API

## Limitations

* This program is written so that you should get an understanding of what is needed to keep a local copy of current job ads. It is not production-ready. 
* The database is for lab purposes, you need to use a better DBMS for production  
* The ads are saved in a single database field, the ad id is saved in a separate field to enable queries on that field
* Timestamp should be saved in the database
* Limited error handling 
* SQLite is slow
* Expect the SQLite database file size to be 600-700 Mb if no filtering is used
* Logging to stdout
* Defaults to getting a subset of ads, based on geographical filtering


## Software

* Python 3.10 (will probably work on 3.8 or 3.9, but not on earlier Python versions)
* Requests (installed with `pip install -r requirements.txt`)  
* Optional: Install a separate tool for viewing data in the database. E.g. `DB Browser for SQLite`

## Database

A local `SQLite` file database is used.  
*This database is for demo purposes and learning how to use the API, do not use it in production*

## Settings
### In the file `settings.py`you can change values such as log level and wait interval


## Setup
* Change PLACES variable in `settings.py` if you want different filtering, or none at all
* Install dependencies with `pip install -r requirements.txt`
* Run `python bootstrap.py`, this will create the database, database table and load it with all currently published ads.

## Run the program to keep your local database updated

* Run `python main.py`  It will update with the interval found in `settings.py`.  
* The variable `MAX_UPDATES` is because this program is just to show how you use the API.  

## Add more columns
### How do I add other columns to the database and save data from the ads in those columns?

Modify some code in database.py:
Check in the file for *# TODO: When adding more fields,* and update the code



## Forum
If you got any questions, contact us in our forum
https://forum.jobtechdev.se/c/vara-api-er-dataset/job-stream/25

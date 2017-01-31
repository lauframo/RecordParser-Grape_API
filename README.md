# WestWing API- File parser

## About
What happens when you get hooked on West Wing and you are trying learn to set up your first API? You create a West Wing API, duh. 
This was a very fun and interesting challenge. It consists of parsing comma-delimited and pipe-delimited strings or files and sort individual items by attribute without the use of Active Record or Rails. It was fun building this system from scratch and rewarding to have a working API.

## How
This project is currently supported by an existing database in CSV format and it is loaded with the main characters of West Wing (Season 1- Season 4). You can interact with the API by:

1. Clone repo

2. Install all gems
``` bash
$ bundle install
```
3. Fire up your local server
```bash
$ bundle exec shotgun
```
4. Start requesting!
For records by color descending:
```bash
$ curl http://localhost:9393/v1/color
```
For records sorted by date of birth, ascending:
```bash
$ curl http://localhost:9393/v1/birthdate
```
For records sorted by last name, descenging:
```bash
$ curl http://localhost:9393/v1/surname
```
To add your own record, send a post request:
```bash
curl --data "LastName=Zoey&FirstName=Barlett&FavoriteColor=lilacn&DateOfBirth=1980-02-20" http://localhost:9393/v1
```

## Dependencies
* Ruby 2.2 or greater
* PostgreSQL
* Sinatra
* Shotgun

## Take Aways
**RSpec green is my favorite color** Testing your entire code is a wise and tedious endeavor. Had tests not been made from the beginning, changes I had to make during the implementation of the API would have been painful if not impossible. With that said, setting up the entire suite provided for moments of euphoria and panic. While this is certainly not my first interaction with Rspec, it is the most extensive test I've done solo and as a result I got acquainted with nuances of the tool I wasn't previously aware of. So again, this was a cool challenge. 

**Grape is so cool!**I am aware this is a pretty simple API, but I was delighted with how straightforward it was. Now that I am familiar with it, I'd like to look into authentication.

This is a standalone Grape API that is accessing my 'fake db' which is the repository: www.github.com/mlee21/ruby_db and possesses the following endpoints which should return json.
Please, follow the instructions for the 'fake db' before proceeding with this application.

* POST /records - Post a single data line in either of the formats supported by your existing code and save it to your file "database"
* GET /records/gender - returns records from your database sorted by gender
* GET /records/birthdate - returns records from your database sorted by birthdate
* GET /records/name - returns records from your database sorted by name

After cloning down the repo:

* run 'bundle'

To run the tests

* run 'rspec'

After running the tests which will include POST requests,
make sure to run this command on the 'fake db' so, that the 'db' is updated.

* ruby lib/data_retriever.rb customer_data_test.csv

To start the server:

* run 'rackup config.ru'

Visit:

* http:/localhost:9292/records/dob
* http:/localhost:9292/records/last_name
* http:/localhost:9292/records/gender

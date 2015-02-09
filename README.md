Chitter
=======
[![Code Climate](https://codeclimate.com/github/abridger/chitter/badges/gpa.svg)](https://codeclimate.com/github/abridger/chitter) [![Test Coverage](https://codeclimate.com/github/abridger/chitter/badges/coverage.svg)](https://codeclimate.com/github/abridger/chitter)

Makers Academy Week 4 Challenge to write a little Twitter clone that allows users to post messages to a public stream.

Features
--------
* Allows users to sign up for the service and to log in
* Allows users to log out
* Allows users to post messages to the public stream
* Displays all messages in the public stream in reverse chronological order

Technologies & Principles
-------------------------
* Ruby
* Sinatra
* Cucumber
* Capybara

Installing & Testing
--------------------
* After cloning the git repo, run `bundle install`
* Requires postgres databases to be set up: `chitter_development` and `chitter_test`
* Also requires a Mailgun API key (for forgotten password emails)
* Tests can be run using `cucumber`

Further Development
-------------------
* Allow users to reply to other users so that they can hold conversations

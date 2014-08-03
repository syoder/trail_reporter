# Trail Reporter

[![Build Status](https://travis-ci.org/syoder/trail_reporter.svg?branch=master)](https://travis-ci.org/syoder/trail_reporter)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.1.1

* System dependencies
    * **Imagemagick** for resizing image uploads 
        * Mac OS X
            * Using brew
                * ``brew install imagemagick``

* Configuration

* Database creation: ``rake db: create``

* Database initialization

* How to run the test suite: ``bundle exec rake``

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# Quick Start

    # Run bundle to pull in dependencies
    > bundle


    # Prepare your configuration files
    > bundle exec rake config:prepare


    # Create the database
    > RAILS_ENV=development bundle exec rake db:create


    # Initialize the database with some seed data:
    > RAILS_ENV=development bundle exec rake db:seed


    # ROCK'N'ROLL!!!
    > RAILS_ENV=development bundle exec rails s



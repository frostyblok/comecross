# Billable Rate System
![](https://github.com/frostyblok/phoenix-timesheet/workflows/CI/badge.svg)

### Table of Contents

1. [Introduction](#introduction)
2. [Setup](#setup)
3. [Running the Application](#running-the-application)


----


# Introduction
This system allows to create entries of their visits, and will also have ability to attach comments, pictures, and Google maps pins.

----


# Setup
Here's how to setup the application on your local computer for development:


### Installation
Follow these instructions to setup your local development environment:

1. Clone the project and `cd` into the project directory
2. Run `docker-compose build` to build the application
3. Run `docker-compose run web rails db:setup` to setup, run migrations, and seed the database.
4Create a config/application.yml file and check out config/application-example.yml for more instructions.


----


# Running the Application

4. Run `docker-compose up` to start the application
5. Run `docker-compose run web rspec spec` to run all the tests for the application.

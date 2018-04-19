
[![devSR](./app/assets/images/logo.png)](http://www.devsr.io)

[![Build Status](https://travis-ci.org/hyrumcarlile/devSR.svg?branch=master)](https://travis-ci.org/hyrumcarlile/devSR)
[![Maintainability](https://api.codeclimate.com/v1/badges/741c953417d0e201f20b/maintainability)](https://codeclimate.com/github/hyrumcarlile/devSR/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/741c953417d0e201f20b/test_coverage)](https://codeclimate.com/github/hyrumcarlile/devSR/test_coverage)

## What is devSR?

devSR is an open source web application inteded primarily for 
users in the tech industry.

The long term vision of this project is to provide soft 
accreditation to non-formal methods of education. For example:
someone teaching themself to code using online tutorials
or mentorship programs, a design student in an apprenticeship
program, or an IT professional taking over a family business.

## How Will We Accredit this Knowlege?

This will obviously be a huge task, and we don't expect we'll get
it right the first time (or possibly the hundredth time). Right now,
we have a system in place where users can endorse other users on
particular skills. An algorithm (which will be kept secret to sway
people from 'abusing the system') gives an amount of 'Skill Rating', 
or 'SR' to the receiver of the endorsement, or endorsee. Eventually,
we would like to integrate with online learning platforms, such as 
Udemy, Udacity, Pluralsight, Lynda.com, Coursera,and even YouTube, to 
assign SR to a user based on the courses they've taken.

Lots of people have covered the business of educating people. We're in
the business of helping people find jobs. Unfortunately, in the current
state of society, it doesn't matter that one knows something. It matters
that they can prove it. We're here to help people prove it.

We need your help! Become a contributor!

## Technical Details

Stack: Ruby on Rails | PostgreSQL (soon: Ruby on Rails | PostgreSQL | GraphQL | React)

Ruby Version: 2.3.4

### Getting Set Up

- Clone this directory
- Download and set up Postgres
- `cd devSR`
- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed`

(Optional) To give the db a bunch of fake data:
- `rake simulate:day number_of_days` 
- i.e. `rake simulate:day 100`

To reset the database (Will drop all data and re-seed your local db):
- `rake db:prepare`
- at which point you can `rake simulate:day` again (or not, whatever)

### How to contribute

- First join our [slack](https://join.slack.com/t/devsrworkspace/shared_invite/enQtMzQ0MzM4NDY1OTM4LTk2YjNjNTVjNjU3YzEwYTU4YWU2ODJmM2I2YzNjOTM2NGU5MDMxMmQ5NzBkOTVjY2M5ZjdmYWY2NDc2NmRjY2Y)!

- Then check out this [wiki article](https://github.com/hyrumcarlile/devSR/wiki/Contributing-to-devSR) for instructions.

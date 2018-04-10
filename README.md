
![devSR](./app/assets/images/logo.png)

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

## Why Open Source?

We'll be very blunt when we say that we're not in this for the money.
We won't raise money. Ever. Why? Because we don't want to be held
accountable to venture capitalists. We want to be held accountable to
our users. Unfortunately, that raises some challenges. We don't have
money to pay people to build this product, so we're calling on developers
everywhere that want to make a difference in the world to pitch in
where they can.

# Technical Details

Stack: Ruby on Rails | PostgreSQL (soon: Ruby on Rails | PostgreSQL | GraphQL | React)

Ruby Version: 2.3.4

## Getting Set Up

- Clone this directory
- Download and set up Postgres
- `cd silvertuna`
- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed`

## What Next

- Pick an item from the section below, or come up with something entirely new
- Create a branch off of master
- Open an MR & create a card on the 'Development' board
- Move the card into the 'Code Review' column when it's done

## What we Need / Next Priorities
*Not necessarily in order of importance

- <b>Security Audit</b>
- Test Suite
- Badges (Acheivements)
- UX Tweaks / Improvements
- Better Home Page
- 'About Us' Page
- Add GraphQL and React

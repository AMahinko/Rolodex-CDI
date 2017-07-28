# Rolodex - A Simple Address Book App

## Deployment instructions
Note: This guide assumes you have Ruby 2+, Rails 4+, Bundler and Ruby gems already installed.

1. Install the Heroku CLI

[OSX installer](https://cli-assets.heroku.com/branches/stable/heroku-osx.pkg)

`wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh` on Linux

2. [Get a Heroku account](www.heroku.com)

3. Open a terminal window, type `heroku login` and follow the prompts

4. Make a commit

5. `heroku apps:create desired_app_name` change desired_app_name to whatever you want

5. `heroku git:remote -a desired_app_name`

6. `git push heroku master`

7. `heroku run rails db:migrate` , to establish the database

After that, simply type `heroku open` or navigate to desired_app_name.herokuapp.com to see Rolodex in action!

## Summary
Rolodex is a basic address book app, allowing a user to create an account, and manage a list of contacts. As a simplifying assumption, currently a contact consists a first and last name, phone number and email. The app was built to streamline the process of adding fields in the future.

Rolodex is built on the rails framework, and rails has a robust library of shorthands and helpers, generates testing files automatically, and is highly modular. It was emphasized to me that clean, reusable code and good test coverage where a priority so rails was the natural choice.

(The CSS is old code, that I copied over. Partly because a bit of presentation never killed anyone, but also to avoid eye-scorching white backgrounds while working on it)

#### Total time taken: 10-12 hours (estimated)

Probably longer, to be honest. I ran into a few stubborn bugs, and went through quite a few phases of refactoring.

#### Test coverage: 98.85% (Get the breakdown by going to /coverage and opening index.html in any browser)

I elected to focus mainly on integration testing and simulating user input, instead of unit testing, as there's very little in the way of business logic on this app, and it's more important that each link/button goes where it needs to and performs the correct database operations.

#### Addons

RSpec, Capybara and simplecov for testing, as well as bcrypt for authentication

#### Future additions

.. Scalability. Paginate the contacts and allow the user to browse through them with AJAX requests, so the user isn't requesting all of their contacts at once whenever they log in.

.. A search function. Pretty essential for an address book.

.. Logins with oauth and google contact integration.

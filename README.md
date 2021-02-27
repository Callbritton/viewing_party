# [Viewing Party](https://viewing-party-2008.herokuapp.com/)

Viewing Party is an application with a focus on API consumption that was created utilizing the viewing party project [base repo](https://backend.turing.io/module3/projects/viewing_party) as part of the Turing School of Software and Design Backend Module 3 cirriculum.

## Table of Contents
1. [About This Project](#about_this_project)
2. [Local Setup](#local_setup)
3. [Testing](#testing)
4. [Deployment](#deployment)
5. [Schema Design](#schema)
6. [Development Team](#development_team)
7. [Learning Achievements](#achievements)

## About This Project <a name="about_this_project"></a>

Viewing party is an application in which users can explore movies, add friends, and create parties to watch movies together! Users can search for a specific movie or they can explore a list of the current top movies. A user can click on a chosen movie's title to be taken to a details page to learn more about that movie including information about the runtime, genre, cast members, and reviews. 

Once a user has chosen a movie, and selected friend's they would like to invite, the user can create a viewing party on a given date, at a specific start time, and for a given duration! 

#### Top 40 Movies:

<img width="778" alt="movies_show_page_reduced_opacity" src="https://user-images.githubusercontent.com/63476564/101782315-d962d280-3ac6-11eb-83c8-5c84a7de2679.png">

#### Movie Details: 

<img width="778" alt="shawhank_movie_show" src="https://user-images.githubusercontent.com/63476564/101776107-72412000-3abe-11eb-840b-5ce7170ef0fe.png">

## Local Setup <a name="local_setup"></a>

This project requires: 
- Ruby 2.5.3.
- Rails 5.2.4.3

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:create`
    * `rails db:migrate`
* Install Figaro with `bundle exec figaro install` to create an application.yml file locally
* Secure an API key from [TheMovieDB API](https://developers.themoviedb.org/3/getting-started/introduction)
* Add your API key to the application.yml file (/config/application.yml): `MOVIE_API_KEY: <your API key>` 

## Testing <a name="testing"></a>

This app utilizes [Travis CI](travis-ci.com) for integrated testing [![Build Status](https://travis-ci.com/JesseMellinger/viewing_party.svg?branch=main)](https://travis-ci.com/JesseMellinger/viewing_party)

Run the test suite with `bundle exec rspec`

#### Viewing Party utilizes the following gems and libraries in testing:

- [VCR](https://github.com/vcr/vcr) 
- [WebMock](https://github.com/bblimke/webmock)
- [FactoryBot](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md)
- [Faker](https://github.com/faker-ruby/faker)
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers)
- [Capybara](https://github.com/teamcapybara/capybara)
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)

## Deployment <a name="deployment"></a>

For local deployment run your development server with `rails s` and visit [localhost:3000](http://localhost:3000) to see the app in action.

[Viewing Party](https://viewing-party-2008.herokuapp.com/) is deployed remotely via Heroku

## Schema <a name="schema"></a>

<img width="998" alt="viewing_party_2008_schema" src="https://user-images.githubusercontent.com/63476564/101641967-6bec6e80-3a00-11eb-8e0b-65e5d3d94894.png">

## Development Team <a name="development_team"></a>

[Jesse Mellinger](https://github.com/JesseMellinger)

[Kevin Cuadros](https://github.com/kevxo)

[Chris Allbritton](https://github.com/callbritton)

#### The team utilized the following resources for build out: 

[TheMovieDB API](https://developers.themoviedb.org/3/getting-started/introduction)

[User stories](https://github.com/Callbritton/viewing_party/projects/1)

[Example wireframes](https://backend.turing.io/module3/projects/viewing_party/wireframes)

## Learning Achievements <a name="achievements"></a>

- Build an application that requires basic authentication
- Consume JSON APIs that require authentication
- Implement self-refential relationships in ActiveRecord
- Utilize continuous Integration using Travis CI
- Apply RuboCop’s style guide for code quality
- Deploy remotely (Heroku)

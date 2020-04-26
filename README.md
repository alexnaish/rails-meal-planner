# Meal Planner in Ruby (as a learning challenge)

## Prerequisites

1) Docker

## Setup

1) `docker-compose build`
1) `docker-compose run --rm --service-ports ruby_dev`
1) `cd myapp`
1) `bundle update && bundle install`
1) `rails server -p $PORT -b 0.0.0.0`
1) Relax!

## Useful Commands

### Drop + Recreate DB

This will destroy your db and then create it and then migrate your current schema.

`rake db:drop db:create db:migrate`

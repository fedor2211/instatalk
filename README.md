# Instatalk

Simple web chatting app

## Requirements
1. Ruby 3.1.2
2. Ruby on Rails 7
3. bundler
4. Postgresql
5. Redis

## Setup
1. Create `.env` files for your environment (`.env.development`, `.env.test` etc.) and fill them with information:
   ```
   INSTATALK_DB_USER=<your_db_username>
   INSTATALK_DB_PASSWORD=<your_db_password>
   ```
2. Run next commands:
   ```
   bundle install
   bin/rails db:prepare
   ```

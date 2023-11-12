# geospatial-app-api

## Getting Started
These instructions will get your copy of the project up and running on your local machine for development and testing purposes.

## Installation

1. Clone the repository

   Begin by cloning the repository to your local machine.
2. Install dependencies

   `bundle install`
3. Environment Setup

   Create a .env file and fill it with data.
   ```
   App uses mapkick-rb gem.
   We need to set MAPBOX_ACCESS_TOKEN=yourToken.
   
   Follow up instructions: 
   https://github.com/ankane/mapkick#installation
   ```
   
4. Create a database & run the migration.
   
   `rails db:setup`

5. Start the server

   `rails s`

6. Access the Application

   Visit http://localhost:3000/tickets to see existing tickets

   Production one: https://geospatial-app-api-788f083a1d08.herokuapp.com/tickets

8. API Usag

   Use Postman or curl to interact with the API:

   * localhost:
   http://localhost:3000/api/v1/tickets

   * production:
   https://geospatial-app-api-788f083a1d08.herokuapp.com/tickets
   

   
   ```   
   api create post:
   https://geospatial-app-api-788f083a1d08.herokuapp.com/api/v1/tickets
   
   Using postman rememmber to set Headers: { key":"Content-Type","value":"application/json" },
   and Body -> raw: sample json from task :)
   ```
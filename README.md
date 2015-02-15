This application is compatible with the latest version of rails and all gems in the Gemfile.

To run this application, install postgresql on your machine.

Currently deployed at https://ottawajazzify.herokuapp.com/

-- Once you have this repository cloned on your machine --
1) go to the root folder
2) bundle install
3) rake db:migrate (rake db:create if needed)
4) rake db:seed (for code tables)
5) rails s (rails server)

To publish your own version on heroku, read their documentation and install their command line tool.

Generate Entity-Relationship Diagram: rake erd. Please don't commit the resulting PDF.

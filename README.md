#Jazzify
[![Build Status](https://travis-ci.org/SeanLF/jazzify.svg?branch=master)](https://travis-ci.org/SeanLF/jazzify)&nbsp;[![Code Climate](https://codeclimate.com/github/SeanLF/jazzify/badges/gpa.svg)](https://codeclimate.com/github/SeanLF/jazzify)&nbsp;[![Dependency Status](https://gemnasium.com/SeanLF/jazzify.svg)](https://gemnasium.com/SeanLF/jazzify)&nbsp;[![Stack Share](http://img.shields.io/badge/tech-stack-0690fa.svg?style=flat)](http://stackshare.io/SeanLF/jazzify)

This application is compatible with the latest version of rails and all gems in the Gemfile.

To run this application, install postgresql on your machine.

Production: https://ottawajazzify.herokuapp.com/<br>
Test: https://ottawajazzifytest.herokuapp.com/

#####Once you have this repository cloned on your machine

```bash
bundle install
rake db:setup
bundle exec rails server
```

To generate an Entity Relationship Diagram, execute <code>rake erd</code>. Please don't commit the resulting PDF.

Don't forget to run <code>heroku run rake assets:precompile</code> for production

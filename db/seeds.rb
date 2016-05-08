# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Import seeds directory files
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each {|seed| load seed}

sean = User.find_or_create_by({email: "sfloy029@uottawa.ca"})
sean.password = "1234567890"
sean.role = Role.find_by({name: "Admin"})
sean.save!
puts "----- done seeds"

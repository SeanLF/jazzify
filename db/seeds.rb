# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add roles
['registered', 'banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

# Add user application status
['Pending', 'Accepted', 'Denied', 'Incomplete'].each do |status|
  UserApplicationStatus.find_or_create_by({status: status})
end

sean = User.find_or_create_by({email: "sfloy029@uottawa.ca"})
sean.password = "1234567890"
sean.role = Role.find_by({name: "admin"})
sean.save!
# Add roles
['Registered', 'Banned', 'Moderator', 'Admin'].each do |role|
  Role.find_or_create_by({name: role})
end
puts "Finished roles seed task"

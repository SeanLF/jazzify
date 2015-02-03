# Add user application status
['Pending', 'Accepted', 'Denied', 'Incomplete'].each do |status|
  UserApplicationStatus.find_or_create_by({status: status})
end
puts "Finished user application status seed task"

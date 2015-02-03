# Add volunteer positions
stage = VolunteerPosition.where(title: "Stage").first_or_create do |vp|
  vp.description = "Stage"
  vp.objective = "To ensure the stage is effectively set up and that performing artists are satisfied with layouts and levels."
  vp.duties = "Assist artists with stage set up for sound checks and performances
    May accompany drivers to transport equipment between venues"
  vp.requirements = "Friendly, energetic, efficient and reliable
    Ability to lift, shift and strike up to 50 pounds of technical equipment on and off stage
    Work promptly and efficiently during set changes
    Ability to take direction
    Knowledge of sound equipment and stage set-up
    Previous experience is an asset, but not essential
    Be able to work in a fast-paced environment
    Licensed venues require Stage Hands to be at least 19 years of age"
  vp.contact_email = "email"
  vp.contact = "contact"
  puts "Created #{vp.title}"
end

souvenirs = VolunteerPosition.where(title: "Souvenirs").first_or_create do |vp|
  vp.description = "To promote and sell merchandise"
  vp.objective = "To promote and sell merchandise"
  vp.duties = "Selling performers’ CD’s and promotional materials, as well as Jazz Festival merchandise when available.
    May be required to help set up the tables and lay out the merchandise for sale."
  vp.requirements = "Must be friendly, efficient and reliable
    Possess good money handling skills
    Confident dealing with the general public – effective communication skills
    Become familiar with the event line up (a program will be provided for referencing)"
  vp.contact_email = "email"
  vp.contact = "contact"
  puts "Created #{vp.title}"
end

transportation = VolunteerPosition.where(title: "Transportation").first_or_create do |vp|
vp.description = "Transportation"
vp.objective = "To provide transportation to performing artists in a safe, friendly and professional manner."
vp.duties = "Transporting artists to and from the airport, hotels and event venues
  May be asked to transport gear etc."
vp.requirements = "A valid driver’s license
  A clean driving record
  Must be 25 years of age or over
  Punctual pick-up and drop-off times essential
  May be required to lift heavy instruments
  Suited to friendly, outgoing and responsible person
  Knowledge of the city and its history
  A high level of professionalism"
vp.contact_email = "email"
vp.contact = "contact"
puts "Created #{vp.title}"
end

site = VolunteerPosition.where(title: "Site").first_or_create do |vp|
  vp.description = "Site"
  vp.objective = "To ensure the park grounds are kept clean and safe for festival patrons, and all levels of service are maximized to accommodate guests to the best of our abilities."
  vp.duties = "Keeping the festival grounds & tables tidy
    Handing out Festival programs at the main entrance
    Monitoring back gate access"
  vp.requirements = "Friendly, energetic, efficient and reliable
    Enjoy working with others
    Be able to work in a fast-paced environment
    Often requires you to stand on your feet for long periods of time
    Confident dealing with the general public – effective communication skills
    Clean, with comfortable footwear"
  vp.contact_email = "email"
  vp.contact = "contact"
  puts "Created #{vp.title}"
end

box_office = VolunteerPosition.where(title: "Box Office").first_or_create do |vp|
  vp.description = "Box Office"
  vp.objective = "To ensure only people who are authorized to attend or participate in a show gain access to the event."
  vp.duties = "Collecting/selling event tickets, checking ID’s and monitoring show entrances at various venues."
  vp.requirements = "Must be friendly, efficient and reliable
    Often requires you to stand on your feet for long periods of time
    Be able to work in a fast-paced environment
    Experience in money handling"
  vp.contact_email = "email"
  vp.contact = "contact"
  puts "Created #{vp.title}"
end


logistics = VolunteerPosition.where(title: "Logistics").first_or_create do |vp|
  vp.description = "Logistics"
  vp.objective = "To create the Outside Site venue grounds so it is visually appealing, effective and safe for patrons, volunteers and performers."
  vp.duties = "Set up and deconstruct the Outside Site logistical settings
    Move tables, chairs, equipment
    Construct the site areas as required"
  vp.requirements = "Requires a great deal of lifting and carrying – must be comfortable with moving large and heavy objects
    Ability to commit to a full day of work before the festival
    Available the morning after the festival to deconstruct the site
    Prepared to take direction and follow instructions
    Enjoys working with others and is a great team player
    Comfortable and sturdy footwear needed - CSA approved recommended"
  vp.contact_email = "email"
  vp.contact = "contact"
  puts "Created #{vp.title}"
end


vip = VolunteerPosition.where(title: "VIP").first_or_create do |vp|
  vp.description = "VIP"
  vp.objective = "To ensure VIP corporate partners enjoy an informative, hospitable experience."
  vp.duties = "Accompany VIP corporate partner guests at festival venues, attend to requests, provide needed information and assist corporate partner representatives as needed."
  vp.requirements = "Good understanding of and appreciate for the value of strong corporate partnerships
    Friendly, confident and reliable
    Possess good judgment and professionalism
    Ability to work in a fast-paced environment
    Keen verbal communication skills"
  vp.contact_email = "email"
  vp.contact = "contact"
  puts "Created #{vp.title}"
end


gold_circle = VolunteerPosition.where(title: "Gold Circle").first_or_create do |vp|
  vp.description = "Gold Circle"
  vp.contact = "contact"
  vp.contact_email = "email"
  puts "Created #{vp.title}"
end
puts "Missing info for gold circle, please fix in seeds/volunteer_positions"


beer = VolunteerPosition.where(title: "Beer").first_or_create do |vp|
  vp.description = "Beer"
  vp.objective = "To serve beer, wine, and coolers to Festival patrons in a courteous, efficient, and professional manner."
  vp.duties = "Pour and serve alcoholic beverages in a responsible manner.
    Work cash box including checking patrons’ IDs and applying all other aspects of Smart Serve as well as handling money.
    Handle inventory, including transporting and changing kegs in a safe and responsible manner."
  vp.requirements = "Friendly, confident and reliable
    Possess good judgment and professionalism
    Ability to work in a fast-paced environment
    Keen verbal communication skills
    Smart Serve certification
    Experience in money handling"
  vp.contact_email = "email"
  vp.contact = "contact"
  puts "Created #{vp.title}"
end


olg = VolunteerPosition.where(title: "OLG").first_or_create do |vp|
  vp.description = "OLG"
  vp.objective = "To create the venue grounds so it is visually appealing, effective and safe for patrons, volunteers and performers."
  vp.duties = "Set up and deconstruct the settings
    Move tables, chairs, equipment
    Construct the site areas as required
    Collect tickets from patrons
    Help clean up area at the end of the night"
  vp.requirements = "Friendly, energetic, efficient and reliable
    Enjoy working with others ​
    Be able to work in a fast-paced environment
    Often requires you to stand on your feet for long periods of time
    Confident dealing with the general public – effective communication skills
    Clean, with comfortable footwear
    Able to work late nights (between 8pm-1am)
    Able to work lunchtime concerts (between 11:30am- 1pm)"
  vp.contact_email = "email"
  vp.contact = "contact"
  puts "Created #{vp.title}"
end


platinum = VolunteerPosition.where(title: "Platinum").first_or_create do |vp|
  vp.description = "Platinum"
  vp.objective = "To ensure Platinum patrons enjoy a hospitable experience."
  vp.duties = "Set up and deconstruct lawn chairs in front of the main stage for patrons
    Construct the site areas as required
    Collect tickets from patrons
    Help clean up area at the end of the night
    Handing out meals which are pre-purchased by patrons sitting in Platinum area"
  vp.requirements = "Friendly, energetic, efficient and reliable
    Enjoy working with others ​
    Be able to work in a fast-paced environment
    Often requires you to stand on your feet for long periods of time outdoors
    Confident dealing with the general public – effective communication skills"
  vp.contact_email = "email"
  vp.contact = "contact"
  puts "Created #{vp.title}"
end


bbq = VolunteerPosition.where(title: "BBQ").first_or_create do |vp|
  vp.description = "BBQ"
  vp.objective = "To prepare and serve food to the hundreds of volunteers at the Ottawa Jazz Festival"
  vp.duties = "Food prep prior to starting bbq
    Some shopping for food, cutlery, etc...
    Make sure area is kept clean including bbq
    Able to handle money transactions"
  vp.requirements = "Must be friendly, efficient and reliable
    Possess good money handling skills
    Confident dealing with the general public – effective communication skills"
  vp.contact_email = "email"
  vp.contact = "contact"
  puts "Created #{vp.title}"
end


communications = VolunteerPosition.where(title: "Communications").first_or_create do |vp|
  vp.description = "Communications"
  vp.objective = "Missing"
  vp.duties = "Manage festival phone calls throughout the festival.
    Answer questions about the Festival and site.
    Takeof lost and found items."
  vp.requirements = "missing"
  vp.contact_email = "email"
  vp.contact = "contact"
  puts "Created #{vp.title}"
end
puts "Missing info for Communications, please fix in seeds/volunteer_positions"

puts "Finished volunteer positions seed task"

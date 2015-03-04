# Add volunteer positions
medical_volunteer = VolunteerPosition.where(title: "Medical Volunteer").first_or_create do |vp|
  vp.description = "As a volunteer medical professional you will be asked to act as an onsite first-aid respondent during shift hours at the Ottawa Jazz Festival."
  vp.objective = "Using professional education and skills, volunteers on this crew will assist in the administration of first aid to our patrons by assessing and treating patients within a specific scope of practice. Previous first aid and CPR qualifications are mandatory."
  vp.duties = "Assist in the administration of first aid
    Call emergency responders"
  vp.requirements = "Proof of First Aid training
    Ability to remain calm under pressure
    Must be 18 years of age or older
    Takes direction well
    May be required to lift heavy instruments
    Suited to friendly, outgoing and responsible person
    A high level of professionalism
    Reports to the Site Volunteer Supervisor"
  vp.contact_email = "chris@ottawachildrensfestival.ca"
  vp.contact = "Chris Elms "
  puts "Created #{vp.title}"
end

beer_tent = VolunteerPosition.where(title: "Beer Tent").first_or_create do |vp|
  vp.description = "Beer Tent - Various locations at Confederation Park and Marion Dewar Plaza"
  vp.objective = "To serve beer, wine, and (in some locations) coolers to Festival patrons in a courteous, efficient, and professional manner."
  vp.duties = "Pour and serve alcoholic beverages in a responsible manner. Work cash box including checking patrons’ IDs and applying all other aspects of Smart Serve as well as handling money. Handle inventory, including transporting and changing kegs in a safe and responsible manner."
  vp.requirements = "Friendly, confident and reliable. Possess good judgment and professionalism. Ability to work in a fast-paced environment. Keen verbal communication skills. Smart Serve certification is a must. Experience in money handling is preferred."
  vp.contact_email = "wendy.f@rogers.com"
  vp.contact = "Wendy Bardach"
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
  vp.contact_email = "PaulTheFlyGuy@yahoo.com"
  vp.contact = "Paul Matthew"
  puts "Created #{vp.title}"
end

gold_circle_tent = VolunteerPosition.where(title: "Gold Circle Tent").first_or_create do |vp|
  vp.description = "Gold Circle Tent - Gate and Bar Service"
  vp.objective = "To ensure only those with a Gold Pass are permitted in the tent. Provide bar service within the tent. Provide patrons with information as required."
  vp.duties = "Checking all passes and wristbands. Bar service is provided within the Gold Tent - this includes pouring beer from a keg cooler and/or pouring wine. As per Smartserve, ensuring that patrons are not over-served. Providing information on all other venues, concerts going on during the festival. Able to direct patrons to various locations throughout the park or off-site, e.g. 4th Stage at the NAC."
  vp.requirements = "Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities. Often requires you to stand on your feet for long periods of time outdoors. Be able to work in a fast-paced environment as well as deal with patrons in a professional manner. Experience in money handling preferred, Smartserve required."
  vp.contact_email = "zolnar@gmail.com"
  vp.contact = "Tom McLay"
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
  vp.contact_email = "johncvetan@hotmail.ca"
  vp.contact = "John Cvetan"
  puts "Created #{vp.title}"
end

site_ = VolunteerPosition.where(title: "Site ").first_or_create do |vp|
  vp.description = "Site Personnel for Gates at various locations throughout Confederation Park and Marion Dewar Plaza."
  vp.objective = "To ensure the park grounds are kept clean and safe for festival patrons, and all levels of service are maximized to accommodate guests to the best of our abilities."
  vp.duties = "Keeping the festival grounds & tables tidy, this includes some garbage detail. Monitoring all gate access, applying wristbands on patrons in a friendly and efficient manner. Checking badges and wristbands."
  vp.requirements = "Friendly, energetic, efficient and reliable. Enjoy working with others. Be able to work in a fast-paced environment. Often requires you to stand on your feet for long periods of time. Confident dealing with the general public – effective communication skills. Clean, with comfortable footwear."
  vp.contact_email = "moogy_2051@yahoo.ca"
  vp.contact = "Sue Head"
  puts "Created #{vp.title}"
end

transportation = VolunteerPosition.where(title: "Transportation").first_or_create do |vp|
  vp.description = "Transportation Driver - various shifts available anytime during the day (6:00 a.m. right through to 3:30 a.m.)"
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
  vp.contact_email = "ddsouza7@hotmail.com"
  vp.contact = "Deborah De Souza"
  puts "Created #{vp.title}"
end

stage = VolunteerPosition.where(title: "Stage").first_or_create do |vp|
  vp.description = "Stage personal at various locations including Confederation Park and MarionDewar Plaza. Shifts available from June 13 through July 4th and vary in length, starting at 9:00 a.m., throughout the day, going as late as 2:00 a.m."
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
  vp.contact_email = "messierj@look.ca"
  vp.contact = "John Messier"
 puts "Created #{vp.title}"
end

brookstreet_hotel = VolunteerPosition.where(title: "Brookstreet Hotel").first_or_create do |vp|
  vp.description = "Brookstreet Hotel - Shifts are 7:30 p.m. - 1:30 a.m. Fr. & Sat. nights, both weekends."
  vp.objective = "To ensure only people who are in possession of a valid ticket to attend or participate in a show gain access to the event."
  vp.duties = "Selling tickets, checking festival passes and wristbands, providing information on various events."
  vp.requirements = "Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities (to provide info. on shows on later dates). )Must be able to work in a fast-paced environment as well as deal with patrons in a professional manner."
  vp.contact_email = "johncvetan@hotmail.ca"
  vp.contact = "John Cvetan"
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
  vp.contact_email = "johncvetan@hotmail.ca"
  vp.contact = "John Cvetan"
  puts "Created #{vp.title}"
end

media_security = VolunteerPosition.where(title: "Media Security").first_or_create do |vp|
  vp.description = "Media Security - at entrance to Media Section"
  vp.objective = "To ensure that only those people with the proper nametags are permitted into the area."
  vp.duties = "Check nametags of people entering this section. Provide information to patrons/media as required. Keep area clean."
  vp.requirements = "Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities (to provide info. on shows on later dates). Must be able to stand for long periods of time, outdoors. As you are dealing with the media you are required to carry yourself in a professional manner."
  vp.contact_email = "ozone@storm.ca"
  vp.contact = "Olga Zuyderhoff"
   puts "Created #{vp.title}"
end

souvenirs = VolunteerPosition.where(title: "Souvenirs").first_or_create do |vp|
  vp.description = "Souvenirs"
  vp.objective = "To promote and sell merchandise"
  vp.duties = "Selling performers’ CD’s and promotional materials, as well as Jazz Festival merchandise when available.
    May be required to help set up the tables and lay out the merchandise for sale."
  vp.requirements = "Must be friendly, efficient and reliable
    Possess good money handling skills
    Confident dealing with the general public – effective communication skills
    Become familiar with the event line up (a program will be provided for referencing)"
  vp.contact_email = "carolrbubbles@gmail.com"
  vp.contact = "Carol Raoult"
  puts "Created #{vp.title}"
end

ticket_scanners = VolunteerPosition.where(title: "Ticket Scanners").first_or_create do |vp|
  vp.description = "Ticket Scanners at various locations including Confederation Park, Marion Dewar Plaza and the NAC"
  vp.objective = "To scan tickets by phone to ensure they are valid before patrons receive the appropriate wristband."
  vp.duties = "Scanning of tickets and informing those placing wristbands on the patrons. Resolving scanner/ticket issues. You are responsible for picking up and returning your phone to the admin trailer at the beginning and end of each shift."
  vp.requirements = "Tech savvy - enough to be able to use a smart phone to scan tickets. Phones are provided with the appropriate software."
  vp.contact_email = "jan.finlay@sympatico.ca"
  vp.contact = "Jan Finlay"
  puts "Created #{vp.title}"
end

rideau_centre = VolunteerPosition.where(title: "Rideau Centre").first_or_create do |vp|
  vp.description = "-"
  vp.objective = ""
  vp.duties = ""
  vp.requirements = ""
  vp.contact_email = "-"
  vp.contact = "-"
  puts "Created #{vp.title} - missing info"
end

office = VolunteerPosition.where(title: "Office").first_or_create do |vp|
  vp.description = "-"
  vp.objective = ""
  vp.duties = ""
  vp.requirements = ""
  vp.contact_email = "-"
  vp.contact = "-"
  puts "Created #{vp.title} - missing info"
end

fourth_stage = VolunteerPosition.where(title: "4th Stage").first_or_create do |vp|
  vp.description = "Located outside the entrance to the NAC 4th Stage (at the corners of Elgin & Queen Streets), we are a Jazz Festival presence."
  vp.objective = "To make sure the door is managed - on site at the NAC 4th Stage, selling/scanning tickets for 4th Stage performances, managing the 4th Stage jazz queues and helping direct the general public to the locations / events they are seeking."
  vp.duties = "Be familiar with the NAC (e.g. location of washrooms, other performance spaces, ATM, elevator, NAC box office, etc.). Learn what other public performances are taking place in the NAC on the same evening, including the jazz festival NAC Studio series. (For private functions such as weddings, graduations, corporate events, etc., direct attendees to the NAC information kiosk downstairs in the main lobby). Be aware of what other jazz festival concerts are being presented on the same day in other venues, and where other jazz festival sites and services are located (e.g., festival box office, Laurier Avenue Canadian Music Stage). Ensure that people are directed to where they want to go, be it one of the 4th Stage queues, somewhere else in the NAC, somewhere outside the building or to someone else in the NAC who can assist (e.g., Information). Assist NAC ushers as appropriate with, e.g., queue management, ensuring everyone has a valid ticket or pass, etc. Respond to questions from the public: aside from NAC-specific questions, you could be asked anything from, e.g. where are the paintings? where can I find something to eat?; where is Glenn Gould’s piano?-- deal with issues that may arise.
    For cash/box office volunteers: collect cash float, tickets, supplies, etc. from Admin trailer in Confederation Park one hour ahead of the first show;• sell and distribute concert tickets at the 4th Stage door; • reconcile cash, receipts and tickets for each concert; • return cash and tickets to Admin trailer approximately one hour after the last show begins.[note: these activities may change due to introduction of scanners"
  vp.requirements = "Must enjoy working with the public, be outgoing and adaptable. Preference will be given to those with cash experience."
  vp.contact_email = "nuriajh@yahoo.com"
  vp.contact = "Nuria Jimenez"
  puts "Created #{vp.title}"
end

box_office_evening = VolunteerPosition.where(title: "Box Office Evening").first_or_create do |vp|
  vp.description = "Box Office Evening Shift - Daily 9:00 - 12:00 p.m. at Confederation Park and/or Marion Dewar Plaza.
    (All volunteers are asked to arrive 15 minutes prior to shift start time.)"
  vp.objective = "To ensure only people who are in possession of a valid ticket to attend or participate in a show gain access to the event."
  vp.duties = "Selling event tickets, festival passes, providing information on various events."
  vp.requirements = "Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities (to provide info. on shows on later dates). Often requires you to stand on your feet for long periods of time outdoors. Be able to work in a fast-paced environment as well as deal with patrons in a professional manner. Experience in money handling - credit card/debit payments and computer experience is preferred. However, training for this will be provided."
  vp.contact_email = "beth.n@sbcglobal.net"
  vp.contact = "Beth Nightingale"
  puts "Created #{vp.title}"
end

box_office_daytime = VolunteerPosition.where(title: "Box Office Daytime").first_or_create do |vp|
  vp.description = "Box Office Daytime Shift - Daily 12:00 - 4:00 p.m. at Confederation Park
    (All volunteers are asked to arrive 15 minutes prior to shift start time.)"
  vp.objective = "To ensure only people who are in possession of a valid ticket to attend or participate in a show gain access to the event."
  vp.duties = "Selling event tickets, festival passes, providing information on various events."
  vp.requirements = "Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities (to provide info. on shows on later dates). Often requires you to stand on your feet for long periods of time outdoors. Be able to work in a fast-paced environment as well as deal with patrons in a professional manner. Experience in money handling - credit card/debit payments and computer experience is preferred. However, training for this will be provided."
  vp.contact_email = "doystamand@sympatico.ca"
  vp.contact = "Réal St. Amand"
  puts "Created #{vp.title}"
end

canadian_music_stage_tent = VolunteerPosition.where(title: "Canadian Music Stage Tent").first_or_create do |vp|
  vp.description = "Canadian Music Stage Tent - Marion Dewar Plaza
    Shift 1: 11:30 a.m. - 1:15 p.m. Minimum 4 shifts PLUS 1 Shift 2 required (because these shifts are so short)
    Shift 2: 7:00 p.m. - 1:00 a.m. Minimum 4 shifts required"
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
    Clean, with comfortable footwear"
  vp.contact_email = "aleksandra_minic@rogers.com"
  vp.contact = "Aleks Minic"
  puts "Created #{vp.title}"
end

nac_studio = VolunteerPosition.where(title: "NAC Studio").first_or_create do |vp|
  vp.description = "NAC Studio Series - Located inside the NAC off the main level."
  vp.objective = "To make sure the door is managed - on site at the NAC Studio, selling/scanning tickets for Studio performances, managing the Studio jazz queues and helping direct the general public to the locations / events they are seeking."
  vp.duties = "Be familiar with the NAC (e.g. location of washrooms, other performance spaces, ATM, elevator, NAC box office, etc.). Learn what other public performances are taking place in the NAC on the same evening, including the jazz festival NAC Studio series. (For private functions such as weddings, graduations, corporate events, etc., direct attendees to the NAC information kiosk downstairs in the main lobby). Be aware of what other jazz festival concerts are being presented on the same day in other venues, and where other jazz festival sites and services are located (e.g., festival box office, Laurier Avenue Canadian Music Stage). Ensure that people are directed to where they want to go, be it one of the 4th Stage queues, somewhere else in the NAC, somewhere outside the building or to someone else in the NAC who can assist (e.g., Information). Assist NAC ushers as appropriate with, e.g., queue management, ensuring everyone has a valid ticket or pass, etc. Respond to questions from the public: aside from NAC-specific questions, you could be asked anything from, e.g. where are the paintings? where can I find something to eat?; where is Glenn Gould’s piano?-- deal with issues that may arise.
    For cash/box office volunteers: collect cash float, tickets, supplies, etc. from Admin trailer in Confederation Park one hour ahead of the first show;• sell and distribute concert tickets at the 4th Stage door; • reconcile cash, receipts and tickets for each concert; • return cash and tickets to Admin trailer approximately one hour after the last show begins.[note: these activities may change due to introduction of scanners"
  vp.requirements = "Must enjoy working with the public, be outgoing and adaptable. Preference will be given to those with cash experience."
  vp.contact_email = "marggold04@yahoo.ca"
  vp.contact = "Margaret Laing"
  puts "Created #{vp.title}"
end

park_hospitality_and_communications = VolunteerPosition.where(title: "Park Hospitality & Communications").first_or_create do |vp|
  vp.description = "Park Hospitality & Communications Trailer Staff"
  vp.objective = "To work in the Hospitality trailer, answering phones and serving volunteers."
  vp.duties = "Manage festival phone calls throughout the festival. Answer questions about the Festival and site. Manage lost and found items. Sell drinks, snacks to volunteers."
  vp.requirements = "Pleasant phone manner, knowledge of all other venues, concerts going on during the festival. Able to direct patrons to various locations throughout the park or off-site, e.g. 4th Stage at the NAC."
  vp.contact_email = "mottd2000@yahoo.ca"
  vp.contact = "Carolyn Mott"
  puts "Created #{vp.title}"
end

vip_tent = VolunteerPosition.where(title: "VIP Tent").first_or_create do |vp|
  vp.description = "VIP Tent - Gate and Bar Service. Shifts are 5:30 p.m. - 11:30 p.m. (usually but no later than midnight)"
  vp.objective = "To ensure only those with VIP tickets are permitted in the tent. Ensure VIP corporate partners enjoy an informative, hospitable experience."
  vp.duties = "Attend to requests,(as directed by the VIP Coordinator or Sponsorship Coordinator). Manage gate entrance to ensure on those with a valid ticket or who are on an invite list are permitted in the tent. Provide needed information and assist corporate partner representatives as needed. Bar service is provided within the VIP Tent - this includes pouring beer from a keg and/or pouring wine. As per Smartserve, ensuring that patrons are not over-served. Providing information on all other venues, concerts going on during the festival. Able to direct patrons to various locations throughout the park or off-site, e.g. 4th Stage at the NAC."
  vp.requirements = "Good understanding of and appreciation for the value of strong corporate partnerships. Friendly, confident and reliable. Possess good judgment and professionalism. Ability to work in a fast-paced environment. Keen verbal communication skills. Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities. Often requires you to stand on your feet for long periods of time outdoors. Be able to work in a fast-paced environment as well as deal with patrons in a professional manner. Experience in money handling preferred, Smartserve required."
  vp.contact_email = "wendy.f@rogers.com"
  vp.contact = "Wendy Bardach"
  puts "Created #{vp.title}"
end

box_office_transition = VolunteerPosition.where(title: "Box Office Transition").first_or_create do |vp|
  vp.description = "Box Office Transition Shift - Daily 4:00 - 9:00 p.m. at Confederation Park.
    (All volunteers are asked to arrive 15 minutes prior to shift start time.)"
  vp.objective = "To ensure only people who are in possession of a valid ticket to attend or participate in a show gain access to the event."
  vp.duties = "Selling event tickets, festival passes, providing information on various events."
  vp.requirements = "Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities (to provide info. on shows on later dates). Often requires you to stand on your feet for long periods of time outdoors. Be able to work in a fast-paced environment as well as deal with patrons in a professional manner. Experience in money handling - credit card/debit payments and computer experience is preferred. However, training for this will be provided."
  vp.contact_email = "sglazer@sympatico.ca"
  vp.contact = "Susan Glazer"
  puts "Created #{vp.title}"
end

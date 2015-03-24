class CreateVolunteerPositionContacts < ActiveRecord::Migration
  def change
    create_table :volunteer_position_contacts do |t|
      t.integer :volunteer_position_id
      t.integer :user_id

      t.timestamps null: false
    end

    # Add VP contact info to new table
    VolunteerPosition.all.each do |vp|
      user = User.find_by(email: vp.contact_email)
      vpc = VolunteerPositionContact.new
      vpc.volunteer_position_id = vp.id
      if user
        vpc.user_id = user.id
      end
      vpc.save!
    end
  end
end

require 'faker'

10.times do
      user = User.new(
        
        email:     Faker::Internet.email,
        password:  "password",
        confirmation_token: Faker::Internet.device_token,
        confirmed_at: Faker::Time.between(2.days.ago, Time.now),
        confirmation_sent_at: Faker::Time.between(2.days.ago, Time.now),
        unconfirmed_email: nil,
        role: Faker::Number.between(0, 2)
         )
     user.save
  end
      
      
       100.times do
   Wiki.create!(

     title:  Faker::Lorem.sentence,
     user_id: Faker::Number.between(1, 10),
     body: Faker::Lorem.paragraph,
    created_at: Faker::Time.between(2.days.ago, Time.now),
     updated_at: Faker::Time.between(2.days.ago, Time.now),
     private: [true,false].sample
   )
 end
      
      puts "#{Wiki.count} wikis created"
      puts "#{User.count} users created"
      
  
    
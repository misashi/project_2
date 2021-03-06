# Users
User.create!(name:  "Joel",
             email: "joel@WebDevImm.com",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated:    true,
             activated_at: Time.zone.now)
40.times do |n|
  name  = Faker::Name.name
  email = "classmate-#{n+1}@WebDevImm.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated:    true,
               activated_at: Time.zone.now)
end


# Microposts
users = User.order(:created_at).take(6)
35.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

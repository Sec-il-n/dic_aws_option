50.times do |n|
  name = Faker::Internet.username
  email = Faker::Internet.email
  password = Faker::Internet.password(min_length: 6)
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
            )
end

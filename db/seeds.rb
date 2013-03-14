require 'faker'

  10.times do
    User.create(name: Faker::Name.name, 
                email: Faker::Internet.email, 
                password: Faker::Lorem.characters(char_count = 8), 
                secret_page: Faker::Internet.url
                )
  end

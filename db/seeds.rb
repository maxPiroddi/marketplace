# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..40
    user = User.new(
        name: Faker::Name.unique.name,
        email: Faker::Internet.email,
        password: "password",
        postcode: rand(1000..4999),
    )
    user.save!
    puts "Created user #{user.name}"
end


for i in 1..20
    user = User.order('RANDOM()').first
   
    prod = Product.new(
        name: Faker::Beer.name,
        price: rand(100..1000),
        location: rand(1000..4999),
        description: Faker::Lorem.sentence,
        user_id: user.id,
    )
    prod.save!
    puts "Created #{prod.name} belonging to #{user.name}"
end
#   Condition, category & user are all required before creating products.

conditions = Condition.create([
    { name: "Poor", description: "Poor condition items have functional problems that will usually require repair or work. " },
    { name: "Fair", description: "Fair items generally work, however, may have some minor functional or cosmetic issues." },
    { name: "Good", description: "Good items are generally in good working order, however, may have some cosmetic blemishes." },
    { name: "Excellent", description: "Excellent gear is in almost-new condition, free of blemishes and heavy use." }
])

categories = Category.create([
    { name: "Guitar", description: "Electric & Acoustic guitars." },
    { name: "Bass", description: "Bass guitars & other bass stringed instruments." },
    { name: "Drums & Percussion", description: "Drum kits, drums & other percussive instruments." },
    { name: "Synth & Keyboards", description: "Pianos, keyboards & synthesizers." },
    { name: "Amplifiers", description: "Guitar, keyboard & general audio amplifiers." },
    { name: "Pro Audio", description: "Professional audio equipment, such as PA systems & mixing desks." }
])

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


for i in 1..40
    user = User.order('RANDOM()').first
    category = Category.order('RANDOM()').first
    condition = Condition.order('RANDOM()').first

    prod = Product.new(
        name: Faker::Beer.name,
        price: rand(5000..99900),
        location: rand(1000..4999),
        description: Faker::Lorem.sentence,
        user_id: user.id,
        category_id: category.id,
        condition_id: condition.id,
    )

    temp_prod_file = Down.download(Faker::LoremPixel.image + "?random=" + rand(1..1000).to_s)
    prod.picture.attach(io: temp_prod_file, filename: File.basename(temp_prod_file.path))

    prod.save!
    puts "Created a #{category.name} item called #{prod.name} belonging to #{user.name} in #{condition.name} condition."
end
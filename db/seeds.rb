users = [{
  username: "timvas",
  email: "test@example.com",
  password: "test123",
  first_name: "Timothy",
  last_name: "Vass",
  bio: "Hej alla glada tjejer!",
  gender: :male,
  birth_date: "1982-02-13",
  height: 189,
  weight: 82,
  eye_color: :mixed,
  marital_status: :single,
  body_type: :athletic,
  tattoos: :none,
  diet: :plant_based,
  exercise: :daily,
  age_range_lower: 18,
  age_range_upper: 40
}]

names = [%w[Adam Brian Charles David Ethan Frank George Henry Ivan John Kevin Liam Michael Nathan Oliver Peter Robert Samuel Thomas William], %w[Amanda Brittany Caroline Diana Elizabeth Fiona Grace Hannah Isabella Jennifer Katie Lauren Michelle Nicole Olivia Patricia Quinn Rachel Sarah Tracy]]
surnames = %w[Smith Johnson Brown Davis Wilson Martinez Anderson Taylor Thomas Jackson White Harris Martin Thompson Garcia Martinez Robinson Clark Rodriguez Lopez Gonzalez]

(1..20).each do |i|
  gender = [0,1].sample
  start_date = Date.new(1970, 1, 1)
  end_date = Date.today - 18.years
  random_date = start_date + rand(end_date - start_date)
  users << {
    username: "user#{i.to_s}",
    email: "test#{i.to_s}@example.com",
    password: "test123",
    first_name: names[gender].sample,
    last_name: surnames.sample,
    gender: [:male, :female][gender],
    birth_date: random_date,
    height: 150 + rand(60),
    weight: 50 + rand(60),
    eye_color: User.eye_color_options.sample,
    marital_status: User.marital_status_options.sample,
    body_type: User.body_type_options.sample,
    tattoos: User.tattoos_options.sample,
    diet: User.diet_options.sample,
    exercise: User.exercise_options.sample,
    age_range_lower: 18 + rand(10),
    age_range_upper: 30 + rand(20)
  }
end
User.create(users)
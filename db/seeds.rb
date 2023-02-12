system("#{Rails.root}/populate_database")

users = [{
  username: "timvas",
  email: "test@example.com",
  password: "test123",
  first_name: "Timothy",
  last_name: "Vass",
  gender: :male,
  birth_date: "1982-02-13",
  height: 189,
  weight: 82,
  eye_color: :mixed,
  marital_status: :single,
  body_type: :athletic,
  tattoos: :tiny,
  diet: :plant_based,
  exercise: :daily,
  age_range_lower: 18,
  age_range_upper: 40,
  distance_radius: 5.0,
  limit_contact_to_age_range: true,
  education: "some_college",
  income_amount: 777777,
  income_currency: "EUR",
  economy_status: "some_savings",
  work_status: "employed",
  attendance_frequency: "every_sabbath",
  tithing_status: "before_tax",
  alms_status: "always_when_asked",
  prayer_frequency: "multiple_times_daily",
  number_of_times_read_bible: 5,
  children_status: true,
  wants_children: "if_yah_wills_will_have_children",
  pets_status: false,
  wants_pets: false
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
    age_range_upper: 30 + rand(20),
    limit_contact_to_age_range: [true,false].sample,
    education: User.education_options.sample,
    income_amount: 1000+rand(222222),
    income_currency: User.income_currency_options.sample,
    economy_status: User.economy_status_options.sample,
    work_status: User.work_status_options.sample,
    attendance_frequency: User.attendance_frequency_options.sample,
    tithing_status: User.tithing_status_options.sample,
    alms_status: User.alms_status_options.sample,
    prayer_frequency: User.prayer_frequency_options.sample,
    number_of_times_read_bible: rand(9),
    children_status: [true,false].sample,
    wants_children: User.wants_children_options.sample,
    pets_status: [true,false].sample,
    wants_pets: [true,false].sample
  }
end
User.create(users)

(1..21).each do |user_id|
  (1..1+rand(10)).each{
    begin
      UserBook.new(user_id: user_id, book_id: Book.order("RANDOM()").limit(1).first.id).save!
    rescue => e
      nil
    end
  }
  (10..10+rand(15)).each{
    begin
      UserInterest.new(user_id: user_id, interest_id: Interest.order("RANDOM()").limit(1).first.id).save!
    rescue => e
      nil
    end
  }
end

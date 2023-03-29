require "rake"
Rake::Task['db:populate_books'].invoke
Rake::Task['db:populate_callings'].invoke
Rake::Task['db:populate_church_responsibilities'].invoke
Rake::Task['db:populate_interest_categories_and_interests'].invoke
Rake::Task['db:populate_languages'].invoke
Rake::Task['db:populate_spiritual_gifts'].invoke

names = [%w[Adam Brian Charles David Ethan Frank George Henry Ivan John Kevin Liam Michael Nathan Oliver Peter Robert Samuel Thomas William], %w[Amanda Brittany Caroline Diana Elizabeth Fiona Grace Hannah Isabella Jennifer Katie Lauren Michelle Nicole Olivia Patricia Quinn Rachel Sarah Tracy]]
surnames = %w[Smith Johnson Brown Davis Wilson Martinez Anderson Taylor Thomas Jackson White Harris Martin Thompson Garcia Martinez Robinson Clark Rodriguez Lopez Gonzalez]

puts "Seeding users"
(1..200).each do |i|
  percent = (i.to_f / 200.0 * 100).to_i
  bar = ("■" * (percent/5).to_i) + ("□" * (20 - (percent/5)).to_i)
  print "\r#{bar} #{percent}%"

  gender = [0,1].sample
  start_date = Date.new(1970, 1, 1)
  end_date = Date.today - 18.years
  random_date = start_date + rand(end_date - start_date)
  User.create({
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
    wants_pets: [true,false].sample,
    smoke_status: User.smoke_status_options.sample,
    sober_status: User.sober_status_options.sample,
    caffeine_status: User.caffeine_status_options.sample,
    drug_status: User.drug_status_options.sample,
    medical_status: User.medical_status_options.sample,
    allergies_status: User.allergies_status_options.sample
  })
end

puts "\nAdding books and interests to users"
(1..200).each do |user_id|
  percent = (user_id.to_f / 200.0 * 100).to_i
  bar = ("■" * (percent/5).to_i) + ("□" * (20 - (percent/5)).to_i)
  print "\r#{bar} #{percent}%"

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
puts "\nDone!"

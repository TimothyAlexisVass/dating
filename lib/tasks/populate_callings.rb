namespace :db do
  description = "Populate the callings table with data"
  desc description
  task populate_callings: :environment do
    puts description
    callings = ["preaching", "bible_work", "ministering", "teaching", "evangelical", "pastoring"]

    callings.each do |calling|
      Calling.find_or_create_by(text: calling)
    end
  end
end
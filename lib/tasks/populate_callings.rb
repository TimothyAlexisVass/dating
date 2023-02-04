namespace :db do
  desc "Populate the callings table with data"
  task populate_callings: :environment do
    callings = ["preaching", "bible_work", "ministering", "teaching", "evangelical", "pastoring"]

    callings.each do |calling|
      Calling.find_or_create_by(text: calling)
    end
  end
end
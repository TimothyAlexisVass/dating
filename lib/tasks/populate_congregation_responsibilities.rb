namespace :db do
  desc "Populate the congregation_responsibilities table with data"
  task populate_congregation_responsibilities: :environment do
    congregation_responsibilities = ["preaching", "sabbath_school_teaching", "janitorial", "technical", "worship_host", "translating", "food", "music"]

    congregation_responsibilities.each do |congregation_responsibility|
      CongregationResponsibility.find_or_create_by(text: congregation_responsibility)
    end
  end
end
namespace :db do
  description = "Populate the church_responsibilities table with data"
  desc description
  task populate_church_responsibilities: :environment do
    puts description
    church_responsibilities = ["preaching", "sabbath_school_teaching", "janitorial", "technical", "worship_host", "translating", "food", "music"]

    church_responsibilities.each do |church_responsibility|
      ChurchResponsibility.find_or_create_by(text: church_responsibility)
    end
  end
end
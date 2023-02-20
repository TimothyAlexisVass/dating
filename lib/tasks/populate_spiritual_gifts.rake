namespace :db do
  description = "Populate the spiritual_gifts table with data"
  desc description
  task populate_spiritual_gifts: :environment do
    puts description
    spiritual_gifts = ["prophecy", "service", "teaching", "exhortation", "giving", "leadership", "mercy", "wisdom", "discernment", "pastoring", "word_of_wisdom", "word_of_knowledge", "faith", "gift_of_healing", "miracles", "distinguishing_of_spirits", "tongues", "interpretation_of_tongues", "helps", "administration", "evangelism", "encouragement"]

    spiritual_gifts.each do |spiritual_gift|
      SpiritualGift.find_or_create_by(text: spiritual_gift)
    end
  end
end
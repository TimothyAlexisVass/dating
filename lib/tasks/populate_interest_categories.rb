namespace :db do
  desc "Populate the interest_categories table with data"
  task populate_interest_categories: :environment do
    interest_categories = ["truth and spirituality", "health and wellness", "rhythm and dancing", "community service", "education and improvement", "music and the arts", "food and cooking", "fitness and exercise", "family and parenting", "history and culture", "science and technology", "travel and adventure", "writing and literature", "photography and video", "outreach and evangelism", "nature and outdoor activities", "sports and recreation", "financial planning and management", "languages and linguistics", "storytelling and performance", "gardening and horticulture", "leadership and mentorship", "pet care and animal welfare", "crafts and hobbies", "ministry and missions", "sustainable living and homesteading", "bible study and theology", "natural healing and therapies"]

    interest_categories.each do |interest_category|
      InterestCategory.find_or_create_by(text: interest_category)
    end
  end
end
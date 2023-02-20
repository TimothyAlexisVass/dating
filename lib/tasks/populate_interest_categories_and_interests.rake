namespace :db do
  description = "Populate the interest_categories and interests tables with data"
  desc description
  task populate_interest_categories_and_interests: :environment do
    puts description
    interest_categories = ["truth and spirituality", "health and wellness", "rhythm and dancing", "community service", "education and improvement", "music and the arts", "food and cooking", "fitness and exercise", "family and parenting", "history and culture", "science and technology", "travel and adventure", "writing and literature", "photography and video", "outreach and evangelism", "nature and outdoor activities", "sports and recreation", "financial planning and management", "languages and linguistics", "storytelling and performance", "gardening and horticulture", "leadership and mentorship", "pet care and animal welfare", "crafts and hobbies", "ministry and missions", "sustainable living and homesteading", "bible study and theology", "natural healing and therapies"]

    interests = [
      {"truth and spirituality": ["Prayer", "Meditation", "Ethics", "Faith", "Moral values"]},
      {"health and wellness": ["Nutrition", "Wellness", "Mental health", "Physical health", "Self-care"]},
      {"rhythm and dancing": ["Dancing", "Rhythm", "Choreography", "Movement", "Ballet", "Jazz", "Tap"]},
      {"community service": ["Volunteering", "Philanthropy", "Charity", "Human rights", "Giving back"]},
      {"education and improvement": ["Personal growth", "Learning", "Seminars", "Skill development", "Courses", "Workshops"]},
      {"music and the arts": ["Music", "Art", "Painting", "Drawing", "Sculpture", "Theater"]},
      {"food and cooking": ["Cuisine", "Recipes", "Baking", "Food culture", "Culinary arts", "Gastronomy", "Meal planning"]},
      {"fitness and exercise": ["Fitness", "Athletics", "Exercise", "Gymnastics", "Running", "Swimming", "Calisthenics", "Biking", "Weightlifting", "Postures", "Pilates"]},
      {"family and parenting": ["Parenting", "Family life", "Marriage", "Relationships", "Child-rearing", "Family therapy", "Adoption", "Foster care"]},
      {"history and culture": ["History", "Culture", "Heritage", "Traditions", "Museums", "Archeology", "Anthropology", "Genealogy", "Civilization"]},
      {"science and technology": ["Science", "Technology", "Engineering", "Mathematics", "Innovation", "Robotics", "Artificial intelligence", "Space exploration", "Computer science"]},
      {"travel and adventure": ["Travel", "Adventure", "Geography", "Wildlife", "Backpacking", "Road trips"]},
      {"writing and literature": ["Writing", "Literature", "Poetry", "Creative writing", "Journalism", "Publishing", "Blogging"]},
      {"photography and video": ["Photography", "Film", "Cinematography", "Video production", "Editing", "Visual arts", "Design", "Imaging"]},
      {"outreach and evangelism": ["Outreach", "Evangelism", "Missionary work", "Preaching", "Religious education", "Social justice"]},
      {"nature and outdoor activities": ["Nature", "Hiking", "Camping", "Climbing", "Rock climbing", "Wildlife observation", "Geocaching"]},
      {"sports and recreation": ["Sports", "Recreation", "Outdoor activities", "Team sports", "Individual sports"]},
      {"financial planning and management": ["Finances", "Budgeting", "Investing", "Retirement planning", "Estate planning", "Personal finance", "Wealth management"]},
      {"languages and linguistics": ["Languages", "Linguistics", "Translation", "Interpretation", "Grammar", "Phonology", "Syntax", "Semiotics"]},
      {"storytelling and performance": ["Storytelling", "Performance", "Acting", "Stand-up comedy", "Improvisation", "Story writing", "Playwriting"]},
      {"gardening and horticulture": ["Gardening", "Horticulture", "Landscaping", "Permaculture", "Syntropic forestry", "Agroforestry", "Forest gardening", "Botany", "Agriculture", "Floriculture", "Land management", "Soil science"]},
      {"leadership and mentorship": ["Leadership", "Mentorship", "Coaching", "Team building", "Management", "Communication", "Strategy", "Development"]},
      {"pet care and animal welfare": ["Pet care", "Animal welfare", "Zoology", "Conservation", "Animal behavior", "Animal rights", "Animal advocacy", "Vet medicine"]},
      {"crafts and hobbies": ["Crafts", "Hobbies", "Woodworking", "Knitting", "Sewing", "Jewelry making", "Pottery", "Ceramics", "Scrapbooking", "Collecting"]},
      {"ministry and missions": ["Ministry", "Missions", "Spiritual growth", "Service"]},
      {"sustainable living and homesteading": ["Sustainable living", "Homesteading", "Green living", "Self-sufficiency"]},
      {"bible study and theology": ["Bible Study", "Theology", "Biblical History", "Apologetics", "Biblical Languages", "Biblical Archaeology", "Biblical Counseling", "Biblical Leadership"]},
      {"natural healing and therapies": ["Physiotherapy", "Herbal Medicine", "Acupuncture", "Massage", "Aromatherapy", "Chiropractic", "Nutritional Therapy", "Art Therapy", "Bodywork", "Sound Healing"]}
    ]
    interest_categories.each do |interest_category|
      InterestCategory.find_or_create_by(text: interest_category)
    end
    interests.each do |interests_hash|
      interest_category_id = InterestCategory.find_by(text: interests_hash.keys.first).id
      interests_hash.values.first.each do |interest|
        Interest.find_or_create_by(text: interest.downcase, interest_category_id: interest_category_id)
      end
    end
  end
end
namespace :db do
  description = "Populate the work_sectors table with data"
  desc description
  task populate_work_sectors: :environment do
    puts description
    work_sectors = ["agriculture and farming", "architecture and engineering", "arts and design", "education", "finance and banking", "healthcare", "hospitality and tourism", "information technology", "law and legal services", "manufacturing", "marketing and advertising", "media and journalism", "non-profit and charity", "real estate", "retail and sales", "science and research", "transportation and logistics", "entertainment", "construction and architecture", "education and teaching", "energy and utilities", "government and public administration", "healthcare", "insurance", "law enforcement and security", "veterinary and animal care"]

    work_sectors.each do |work_sector|
      WorkSector.find_or_create_by(text: work_sector)
    end
  end
end
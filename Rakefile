# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Dir[File.join(Rails.root, "lib/tasks/**/*.rb")].each { |f| require f }

Rails.application.load_tasks

namespace :db do
  desc "Truncate all tables"
  task truncate: :environment do
  	DatabaseCleaner.clean_with :truncation
  end

end

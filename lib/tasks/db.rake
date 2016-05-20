namespace :db do
  desc 'setup the database'
  task :setup => :environment do
    DB.create_table! :todos do
      primary_key :id
      String :text
    end
  end

  desc 'seed with example data'
  task :seed => :environment  do
    FactoryGirl.find_definitions

    user = FactoryGirl.create :user

    10.times.collect do
      FactoryGirl.create :blog, :with_posts, owner: user
    end

  end
end

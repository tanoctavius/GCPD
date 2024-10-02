namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'contexts'
  # executing 'rake db:contexts' will cause this script to run
  task :api_contexts => :environment do
    # Drop the old db and recreate from scratch
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    # Invoke rake db:migrate to set up db structure based on latest migrations
    Rake::Task['db:migrate'].invoke
    # Set up test database with that same structure
    Rake::Task['db:test:prepare'].invoke

    # Now go get the contexts and run the build extended to match cucumber
    require './test/contexts'
    include Contexts
    create_extended_context
    # change two dates as in cucumber adv tests
    @lacey.date_opened = "2023-04-23"
    @lacey.save
    @harbor.date_opened = "2023-01-23"
    @harbor.save
    
  end
end
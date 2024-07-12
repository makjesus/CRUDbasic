require 'active_record'
require 'sinatra/activerecord/rake'

namespace :db do
  desc "Create a migration"
  task :create_migration do |t, args|
    name = ENV['NAME']
    unless name
      puts "You must provide a NAME for the migration"
      exit(1)
    end
    system("rails generate migration #{name}")
  end
end

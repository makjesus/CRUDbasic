require 'active_support/core_ext/object/blank'
require 'set'

begin
  require 'mysql'
rescue LoadError
  raise "!!! Missing the mysql gem. Add it to your Gemfile: gem 'mysql'"
end

unless defined?(Mysql::Result) && Mysql::Result.method_defined?(:each_hash)
  raise "!!! Outdated mysql gem. Upgrade to 2.8.1 or later. In your Gemfile: gem 'mysql', '2.8.1'. Or use gem 'mysql2'"
end
gem 'mysql', '~> 2.8.1'
require 'mysql'

class Mysql
  class Time

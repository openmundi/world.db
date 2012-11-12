## for use to run with interactive ruby (irb)
##  e.g.  irb -r ./sandbox/console.rb

require 'worlddb'

# some ruby stdlibs

require 'logger'
require 'pp'   # pretty printer
require 'uri'
require 'json'
require 'yaml'


## shortcuts for models

Tag     = WorldDB::Models::Tag
Tagging = WorldDB::Models::Tagging
Country = WorldDB::Models::Country
Region  = WorldDB::Models::Region
City    = WorldDB::Models::City
Prop    = WorldDB::Models::Prop

## connect to db

DB_CONFIG = {
  adapter:  'sqlite3',
  database: 'world.db'
}

pp DB_CONFIG
ActiveRecord::Base.establish_connection( DB_CONFIG )

## turn on activerecord logging to console

ActiveRecord::Base.logger = Logger.new( STDOUT )


## test drive

puts "Welcome to world.db, version #{WorldDB::VERSION}!"
puts "  #{City.count} cities"
puts "  #{Tagging.count} taggings"
puts "Ready."

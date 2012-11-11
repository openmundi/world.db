#############################
### Build a new world.db

require 'pp'
require 'worlddb'


DB_ROOT="./db"

DB_CONFIG = {
  adapter:  'sqlite3',
  database: 'world.db'
}


task :default => 'release'

desc "clean db build for release"
task :release => [:clean,:create,:import] do
  puts "hello from release build script"
end

task :clean do
  rm "#{DB_CONFIG[:database]}" if File.exists?( DB_CONFIG[:database] )
end

task :env do
  pp DB_CONFIG
  ActiveRecord::Base.establish_connection( DB_CONFIG )
end

desc "create db schema"
task :create => [:env, :clean] do
  WorldDB::CreateDB.up
end

desc "import db seeds from folder '#{DB_ROOT}'"
task :import => :env do
  
  reader = WorldDB::Reader.new
 
  ['africa/countries',
   'america/countries',
   'america/br/regions',
   'america/br/cities',
   'america/ca/regions',
   'america/ca/cities',
   'america/mx/cities',
   'america/us/regions',
   'america/us/cities',
   'america/ve/regions',
   'america/ve/cities',
   'asia/countries',
   'asia/jp/cities',
   'europe/countries',
   'europe/at/regions',
   'europe/at/cities',
   'europe/be/cities',
   'europe/by/cities',
   'europe/ch/cities',
   'europe/cy/cities',
   'europe/de/regions',
   'europe/de/cities',
   'europe/dk/cities',
   'europe/en/cities',
   'europe/es/cities',
   'europe/fr/cities',
   'europe/gr/cities',
   'europe/hr/cities',
   'europe/it/cities',
   'europe/nl/cities',
   'europe/pt/cities',
   'europe/ro/cities',
   'europe/ru/cities',
   'europe/sc/cities',
   'europe/tr/cities',
   'europe/ua/cities',
   'oceania/countries',
   'oceania/au/cities'
   ].each do |seed|
    
    if seed =~ /countries/
      reader.load_countries_with_include_path( seed, DB_ROOT )
    elsif seed =~ /\/([a-z]{2})\/cities/
      reader.load_cities_with_include_path( $1, seed, DB_ROOT )
    elsif seed =~ /\/([a-z]{2})\/regions/
      reader.load_regions_with_include_path( $1, seed, DB_ROOT )
    else
      puts "**** unknown fixture type >#{seed}<"
      # todo/fix: exit w/ error
    end
    
  end
end

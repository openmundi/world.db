#############################
### Build a new world.db

# stdlibs

require 'pp'


# 3rd party libs/gems

require 'logutils/db'
require 'worlddb'


BUILD_DIR = "./build"
DATA_DIR  = "."


WORLD_DB_PATH = "#{BUILD_DIR}/world.db"

DB_CONFIG = {
  adapter:  'sqlite3',
  database:  WORLD_DB_PATH
}


task :default => 'release'


directory BUILD_DIR   # make sure it exists


desc "clean db build for release"
task :release => [BUILD_DIR, :clean,:create,:import] do
  puts "hello from world.db release build script"
end

task :clean do
  rm WORLD_DB_PATH if File.exists?( WORLD_DB_PATH )
end

task :env do
  pp DB_CONFIG
  ActiveRecord::Base.establish_connection( DB_CONFIG )
end

desc "create db schema"
task :create => [:env, :clean] do
  LogDb.create
  WorldDb.create
end

desc "import db seeds from folder '#{DATA_DIR}'"
task :import => :env do

  WorldDb.read_setup( 'setups/all', DATA_DIR )
  WorldDb.stats

end



=begin
task :world => [:countries,:regions,cities] do
  
end

task :countries => :env do

  reader = WorldDB::Reader.new
 
#  FileList['*/countries.txt'].each do |file|
  ## todo: remove .txt extension
#  end
  
end

task :regions
task :cities
=end
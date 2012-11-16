###
# NB: for local testing run like:
#
# 1.9.x: ruby -Ilib lib/worlddb.rb

# core and stlibs

require 'yaml'
require 'pp'
require 'logger'
require 'optparse'
require 'fileutils'
require 'erb'

# rubygems

require 'active_record'   ## todo: add sqlite3? etc.


# our own code

module WorldDB   # forward reference; more to come later
end

require 'worlddb/models/prop'
require 'worlddb/models/country'
require 'worlddb/models/region'
require 'worlddb/models/city'
require 'worlddb/models/tag'
require 'worlddb/models/tagging'
require 'worlddb/schema'       # NB: requires worlddb/models (include WorldDB::Models)
require 'worlddb/reader'
require 'worlddb/loader'
require 'worlddb/version'
require 'worlddb/cli/opts'
require 'worlddb/cli/runner'

module WorldDB

  def self.banner
    "worlddb #{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end

  def self.main
    Runner.new.run(ARGV)
  end
  
  def self.create
    CreateDB.up
  end

  # load built-in (that is, bundled within the gem) named seeds
  # - pass in an array of seed names e.g. [ 'countries', 'at/cities', 'de/cities' ] etc.

  def self.load( ary )
    loader = Loader.new
    ary.each do |name|
      loader.load_fixtures_builtin( name )
    end
  end

  def self.fixtures  # all builtin fixtures; helper for covenience

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
   ]
  end


  def self.read( ary )
    reader = Reader.new
    ary.each do |name|
      reader.load_builtin( name )
    end
  end

  def self.read_all  # load all builtins (using plain text reader); helper for convenience
    reader = Reader.new

    # too big for heroku free db plan (10,000 record limit)
    #  - sorry, can't load by default
    fixture_excludes = [
      'america/br/cities',
      'america/ve/cities'
    ]
    
    ary = fixtures - fixture_excludes
    
    ary.each do |name|
     reader.load_builtin( name )
    end # each name
  end # method load_all


  class Deleter
    ## todo: move into its own file???    
    
    ## make models available in worlddb module by default with namespace
    #  e.g. lets you use City instead of Models::City 
    include WorldDB::Models

    def run( args=[] )
      # for now delete all tables
      
      Tagging.delete_all
      Tag.delete_all
      City.delete_all
      Region.delete_all
      Country.delete_all
      Prop.delete_all
    end
    
  end
  
  # delete ALL records (use with care!)
  def self.delete!
    Deleter.new.run
  end # method delete!

  
end  # module WorldDB


WorldDB.main if __FILE__ == $0
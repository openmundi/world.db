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


require 'worlddb/version'

require 'worlddb/models/prop'
require 'worlddb/models/country'
require 'worlddb/models/region'
require 'worlddb/models/city'
require 'worlddb/models/tag'
require 'worlddb/models/tagging'
require 'worlddb/schema'       # NB: requires worlddb/models (include WorldDB::Models)
require 'worlddb/utils'
require 'worlddb/readers/line_reader'
require 'worlddb/readers/values_reader'
require 'worlddb/readers/hash_reader'
require 'worlddb/reader'
require 'worlddb/loader'
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
   'africa/fifa',
   'africa/iso3',
   'america/countries',
   'america/br/regions',
   'america/br/cities',
   'america/ca/regions',
   'america/ca/cities',
   'america/mx/regions',
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
   'europe/be/regions',
   'europe/be/cities',
   'europe/bg/cities',
   'europe/by/cities',
   'europe/ch/cities',
   'europe/cy/cities',
   'europe/cz/regions',
   'europe/cz/cities',
   'europe/de/regions',
   'europe/de/cities',
   'europe/dk/cities',
   'europe/ee/cities',
   'europe/en/regions',
   'europe/en/cities',
   'europe/es/regions',
   'europe/es/cities',
   'europe/fi/cities',
   'europe/fr/regions',
   'europe/fr/cities',
   'europe/gr/cities',
   'europe/hr/cities',
   'europe/hu/cities',
   'europe/ie/cities',
   'europe/it/cities',
   'europe/lt/cities',
   'europe/lv/cities',
   'europe/nl/cities',
   'europe/no/cities',
   'europe/pl/cities',
   'europe/pt/cities',
   'europe/ro/cities',
   'europe/rs/cities',
   'europe/ru/cities',
   'europe/sc/cities',
   'europe/se/cities',
   'europe/tr/cities',
   'europe/ua/cities',
   'europe/wa/cities',
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
    puts '*** deleting world table records/data...'
    Deleter.new.run
  end # method delete!

  class Stats
    include WorldDB::Models

    def tables
      puts "Stats:"
      puts " #{'%5d' % Country.count} countries (#{Country.where(s: true).count} supras, #{Country.where(d:true).count} deps)"
      puts " #{'%5d' % Region.count} regions"
      puts " #{'%5d' % City.where(m: true).where(c: false).count} metros"
      puts " #{'%5d' % City.where(c: true).count} cities (#{City.where(c: true).where(m: true).count} metros)"
      puts " #{'%5d' % City.where(d: true).count} districts"
      puts " #{'%5d' % Tag.count} tags"
      puts " #{'%5d' % Tagging.count} taggings"
    end
    
    def props
      puts "Props:"
      Prop.order( 'created_at asc' ).all.each do |prop|
        puts "  #{prop.key} / #{prop.value} || #{prop.created_at}"
      end
    end
  end

  def self.stats
    stats = Stats.new
    stats.tables
    ### stats.props
  end

  def self.tables
    Stats.new.tables
  end

  def self.props
    Stats.new.props
  end

end  # module WorldDB


if __FILE__ == $0
  WorldDB.main
else
  # say hello
  puts WorldDB.banner
end
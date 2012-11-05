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
require 'worlddb/schema'       # NB: requires worlddb/models (include WorldDB::Models)
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
  
end  # module WorldDB


WorldDB.main if __FILE__ == $0
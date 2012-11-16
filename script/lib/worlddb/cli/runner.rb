
module WorldDB

class Runner

  include WorldDB::Models

  def initialize
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::INFO

    @opts    = Opts.new
  end

  attr_reader :logger, :opts


  def run( args )
    opt=OptionParser.new do |cmd|
    
      cmd.banner = "Usage: worlddb [options]"

      ## NB: reserve -c for use with -c/--config
      cmd.on( '--create', 'Create DB schema' ) { opts.create = true }
      cmd.on( '--setup',  "Create DB schema 'n' load builtin world data" ) { opts.setup = true }

      ### todo: in future allow multiple search path??
      cmd.on( '-i', '--include PATH', "Data path (default is #{opts.data_path})" ) { |path| opts.data_path = path }

      cmd.on( '--country KEY', "Default country for regions 'n' cities" ) { |key| opts.country = key; }

      ## todo: add (generic) alias -t/--type cities for --cities
      ##                           -t/--type regions for --regions
      ##                           -t/--type countries for --countries  --why? why not?
      
      cmd.on( '--countries', 'Use country plain text fixture reader' ) { opts.countries = true }
      cmd.on( '--regions',   'Use regions plain text fixture reader' ) { opts.regions   = true }
      cmd.on( '--cities',    'Use cities  plain text fixture reader' ) { opts.cities    = true }

      ## todo: change to --builtin?? more clear why? why not?
      cmd.on( '--load', 'Use loader for builtin world data' ) { opts.load = true }
      
      cmd.on( '--delete', 'Delete all records' ) { opts.delete = true }

      cmd.on( '-v', '--version', "Show version" ) do
        puts WorldDB.banner
        exit
      end

      cmd.on( "--verbose", "Show debug trace" )  do
        logger.datetime_format = "%H:%H:%S"
        logger.level = Logger::DEBUG
        
        ActiveRecord::Base.logger = Logger.new(STDOUT)
      end

      cmd.on_tail( "-h", "--help", "Show this message" ) do
        puts <<EOS

worlddb - world.db command line tool, version #{VERSION}

#{cmd.help}

Examples:
    worlddb at/cities                      # import austrian cities
    worlddb --create                       # create database schema

More Examples:
    worlddb                                # show stats (table counts, table props)

Further information:
  http://geraldb.github.com/world.db
  
EOS
        exit
      end
    end

    opt.parse!( args )
  
    puts WorldDB.banner

    puts "working directory: #{Dir.pwd}"
 
    db_config = {
      adapter:  'sqlite3',
      database: "#{opts.output_path}/world.db"
    }
  
    puts "Connecting to db using settings: "
    pp db_config

    ActiveRecord::Base.establish_connection( db_config )
    
    if opts.setup?
      WorldDB.create
      WorldDB.read_all
    else
      WorldDB.create   if opts.create?
      WorldDB.delete!  if opts.delete?

      if opts.countries? || opts.regions? || opts.cities?
        Reader.new( logger ).run( opts, args )  # load/read plain text country/region/city fixtures
      else
        Loader.new( logger ).run( opts, args ) # load ruby fixtures
      end
    end

    WorldDB.stats
    
    puts 'Done.'
    
  end   # method run

end # class Runner
end # module WorldDB
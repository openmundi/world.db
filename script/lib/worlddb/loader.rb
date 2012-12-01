module WorldDB

class Loader

## make models available in worlddb module by default with namespace
#  e.g. lets you use City instead of Models::City 
  include WorldDB::Models


  def initialize( logger=nil )
    if logger.nil?
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::INFO
    else
      @logger = logger
    end
  end

  attr_reader :logger


  def run( opts, args )

    args.each do |arg|
      name = arg     # File.basename( arg, '.*' )
      
      if opts.load?
        load_fixtures_builtin( name )
      else
        load_fixtures_with_include_path( name, opts.data_path )
      end
    end
    
  end # method run


  def load_fixtures_with_include_path( name, include_path )  # load from file system
    path = "#{include_path}/#{name}.rb"
 
    puts "*** loading data '#{name}' (#{path})..."

    code = File.read( path )
    
    load_fixtures_worker( code )
  end
  
  def load_fixtures_builtin( name ) # load from gem (built-in)
    path = "#{WorldDB.root}/data/#{name}.rb"

    puts "*** loading data '#{name}' (#{path})..."

    code = File.read( path )
    
    load_fixtures_worker( code )
  end
  

private
  def load_fixtures_worker( code )
    
    self.class_eval( code )

    # NB: same as
    #
    # module WorldDB
    #   include WorldDB::Models
    #  <code here>
    # end
    
    # Prop.create!( :key => "db.#{name}.version", :value => SportDB::VERSION )
    
  end
  
end # class Loader
end # module WorldDB

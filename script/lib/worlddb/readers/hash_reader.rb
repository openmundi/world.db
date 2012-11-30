# encoding: utf-8


class HashReader

  def initialize( logger=nil, path )
    if logger.nil?
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::INFO
    else
      @logger = logger
    end
    
    @path = path

    ## nb: assume/enfore utf-8 encoding (with or without BOM - byte order mark)
    ## - see worlddb/utils.rb
    @hash = YAML.load( File.read_utf8( @path ))
  end

  attr_reader :logger, :hash
  
end # class HashReader

module WorldDB

class Reader

## make models available in sportdb module by default with namespace
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
        load_cities_builtin( opts.country, name )
      else
        load_cities_with_include_path( opts.country, name, opts.data_path )
      end
    end

  end


  def load_cities_with_include_path( country_key, name, include_path )  # load from file system
    path = "#{include_path}/#{name}.txt"

    puts "*** parsing data '#{name}' (#{path})..."

    text = File.read( path )
    
    load_cities_worker( country_key, text )
  end

  def load_cities_builtin( country_key, name ) # load from gem (built-in)
    path = "#{WorldDB.root}/db/#{name}.txt"

    puts "*** parsing data '#{name}' (#{path})..."

    text = File.read( path )
    
    load_cities_worker( country_key, text )
  end


private
  def load_cities_worker( country_key, data )
   
    ## assume active activerecord connection
    ##
    
    @country = Country.find_by_key!( country_key )
    
    puts "Country #{@country.key} >#{@country.title} (#{@country.tag})<"
     
    data.each_line do |line|
  
      if line =~ /^\s*#/
        # skip komments and do NOT copy to result (keep comments secret!)
        logger.debug 'skipping comment line'
        next
      end
        
      if line =~ /^\s*$/ 
        # kommentar oder leerzeile überspringen 
        logger.debug 'skipping blank line'
        next
      end

      # remove leading and trailing whitespace
      line = line.strip

      values = line.split(',')
      
      # remove leading and trailing whitespace for values
      values = values.map { |value| value.strip }
      
      puts "line: >>#{line}<<"
      puts "  values: >>#{values.join('<< >>')}<<"
      
      attribs = {
        key: values[0]
      }
      
      ## title (split of optional synonyms)
      # e.g. FC Bayern Muenchen|Bayern Muenchen|Bayern
      titles = values[1].split('|')
      
      attribs[ :title ]    =  titles[0]
      ## add optional synonyms
      attribs[ :synonyms ] =  titles[1..-1].join('|')  if titles.size > 1
      
      attribs[ :country_id ] = @country.id
      
      value_numbers = []
      
      ## check for optional values
      values[2..-1].each do |value|
        if value =~ /^region:/   ## region:
          value_region_key = value[7..-1]  ## cut off region: prefix
          value_region = Region.find_by_key!( value_region_key )
          attribs[ :region_id ] = value_region.id
        elsif value =~ /^\d+$/    ## numeric
          value_numbers << value.to_i
        elsif value =~ /^#/   ## start with # treat it as a comment column
          # do nothing; ignore
        else
          # issue warning: unknown type for value
          puts "*** warning: unknown type for value >#{value}<"
        end
      end
      
      if value_numbers.size > 0
        attribs[ :pop  ] = value_numbers[0]
        attribs[ :area ] = value_numbers[1]
      end

      city = City.find_by_key( attribs[ :key ] )
      if city.present?
        puts "*** update city #{city.id}-#{city.key}:"
      else
        puts "*** create city:"
        city = City.new
      end
      
      puts attribs.to_json
   
      city.update_attributes!( attribs )
        
    end # data.each
        
  end # method load_cities_worker

  
end # class Reader
end # module WorldDB

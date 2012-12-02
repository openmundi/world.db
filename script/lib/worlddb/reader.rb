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
        load_countries_builtin( name )             if opts.countries?
        load_regions_builtin( opts.country, name ) if opts.regions?
        load_cities_builtin( opts.country, name )  if opts.cities?
      else
        load_countries_with_include_path( name, opts.data_path )              if opts.countries?
        load_regions_with_include_path( opts.country, name, opts.data_path )  if opts.regions?
        load_cities_with_include_path( opts.country, name, opts.data_path )   if opts.cities?
      end
    end

  end


  ############################
  # load from file system
  
  def load_with_include_path( name, include_path )
    if name =~ /^([a-z]{3,})\/countries/
      ## auto-add continent (from folder structure) as tag
      load_countries_with_include_path( name, include_path, :tags => $1 )
    elsif name =~ /\/([a-z]{2})\/cities/
      ## auto-add required country code (from folder structure)
      load_cities_with_include_path( $1, name, include_path )
    elsif name =~ /\/([a-z]{2})\/regions/
      ## auto-add required country code (from folder structure)
      load_regions_with_include_path( $1, name, include_path )
    else
      puts "*** error: unknown world.db fixture type >#{name}<"
      # todo/fix: exit w/ error
    end
  end

  def load_countries_with_include_path( name, include_path, more_values={} )
    load_fixtures_with_include_path_for( Country, name, include_path, more_values )
  end

  def load_regions_with_include_path( country_key, name, include_path )
    country = Country.find_by_key!( country_key )
    puts "Country #{country.key} >#{country.title} (#{country.code})<"

    load_fixtures_with_include_path_for( Region, name, include_path, country_id: country.id )
  end

  def load_cities_with_include_path( country_key, name, include_path )  
    country = Country.find_by_key!( country_key )
    puts "Country #{country.key} >#{country.title} (#{country.code})<"

    load_fixtures_with_include_path_for( City, name, include_path, country_id: country.id )
  end
  
  ##################################
  #  load from gem (built-in)

  def load_builtin( name )  ## convenience helper (requires proper named files w/ convention)

## add motor, wikipedia, net, etc.

    if name =~ /\/fifa/
       load_fifa_builtin( name )
    elsif name =~ /\/iso3/
       load_iso3_builtin( name )
    elsif name =~ /^([a-z]{3,})\/countries/     # e.g. africa/countries or america/countries
      ## auto-add continent (from folder structure) as tag
       load_countries_builtin( name, :tags => $1 )
    elsif name =~ /\/([a-z]{2})\/cities/
       load_cities_builtin( $1, name )
    elsif name =~ /\/([a-z]{2})\/regions/
       load_regions_builtin( $1, name )
    else
       puts "*** error: unknown world.db fixture type >#{name}<"
       # todo/fix: exit w/ error
    end
  end

  def load_countries_builtin( name, more_values )
    load_fixtures_builtin_for( Country, name, more_values )
  end

  def load_regions_builtin( country_key, name )
    country = Country.find_by_key!( country_key )
    puts "Country #{country.key} >#{country.title} (#{country.code})<"
  
    load_fixtures_builtin_for( Region, name, country_id: country.id )
  end
  
  def load_cities_builtin( country_key, name )
    country = Country.find_by_key!( country_key )
    puts "Country #{country.key} >#{country.title} (#{country.code})<"

    load_fixtures_builtin_for( City, name, country_id: country.id )
  end


  def load_iso3_builtin( name )
    path = "#{WorldDB.root}/data/#{name}.yml"

    puts "*** parsing data '#{name}' (#{path})..."

    reader = HashReader.new( logger, path )
    
    ### fix: use each on reader!!! move normalize into reader
    reader.hash.each do |key_wild, value_wild|
    
      # normalize
      # - key n value as string (not symbols, bool? int? array?)
      # - remove leading and trailing whitespace
      key   = key_wild.to_s.strip
      value = value_wild.to_s.strip
      
      puts ">>#{key}<< >>#{value}<<"
    
      country = Country.find_by_key!( key )
      country.iso3 = value
      country.save!
    
    end

    Prop.create!( key: "db.#{fixture_name_to_prop_key(name)}.version", value: "world.yml.#{WorldDB::VERSION}" )
  end

  def load_fifa_builtin( name )
    path = "#{WorldDB.root}/data/#{name}.yml"

    puts "*** parsing data '#{name}' (#{path})..."

    reader = HashReader.new( logger, path )
    
    reader.hash.each do |key_wild, value_wild|
    
      # normalize
      key   = key_wild.to_s.strip
      value = value_wild.to_s.strip
      
      puts ">>#{key}<< >>#{value}<<"
    
      country = Country.find_by_key!( key )
      country.fifa = value
      country.save!
    
    end

    Prop.create!( key: "db.#{fixture_name_to_prop_key(name)}.version", value: "world.yml.#{WorldDB::VERSION}"  )
  end


private
  def load_fixtures_with_include_path_for( clazz, name, include_path, more_values={} )  # load from file system
    path = "#{include_path}/#{name}.txt"

    puts "*** parsing data '#{name}' (#{path})..."

    reader = ValuesReader.new( logger, path, more_values )
    
    load_fixtures_worker_for( clazz, reader )

    Prop.create!( key: "db.#{fixture_name_to_prop_key(name)}.version", value: "file.txt.#{File.mtime(path).strftime('%Y.%m.%d')}" )        
  end

  def load_fixtures_builtin_for( clazz, name, more_values={} ) # load from gem (built-in)
    path = "#{WorldDB.root}/data/#{name}.txt"

    puts "*** parsing data '#{name}' (#{path})..."

    reader = ValuesReader.new( logger, path, more_values )
    
    load_fixtures_worker_for( clazz, reader )

    Prop.create!( key: "db.#{fixture_name_to_prop_key(name)}.version", value: "world.txt.#{WorldDB::VERSION}" )
  end


  def load_fixtures_worker_for( clazz, reader )
   
    ## NB: assumes active activerecord db connection
    ##

    reader.each_line do |attribs, values|
  
      value_numbers     = []
      value_tag_keys    = []
      
      ### check for "default" tags - that is, if present attribs[:tags] remove from hash
      
      if attribs[:tags].present?
        more_tag_keys = attribs[:tags].split('|')
        attribs.delete(:tags)

        ## unify; replace _w/ space; remove leading n trailing whitespace
        more_tag_keys = more_tag_keys.map do |key|
          key = key.gsub( '_', ' ' )
          key = key.strip
          key
        end

        value_tag_keys += more_tag_keys
      end


      if clazz == City
        attribs[ :c ] = true   # assume city type by default (use metro,district to change in fixture)
      elsif clazz == Country
        attribs[ :c ] = true   # assume country type by default (use supra,depend to change)
      end
      
      ## check for optional values
      values.each_with_index do |value,index|
        if value =~ /^region:/   ## region:
          value_region_key = value[7..-1]  ## cut off region: prefix
          ## NB: requires country_id to make unique!
          value_region = Region.find_by_key_and_country_id!( value_region_key, attribs[:country_id] )
          attribs[ :region_id ] = value_region.id
        elsif value =~ /^metro$/   ## metro(politan area)
          attribs[ :c ] = false   # turn off default c|city flag; make it m|metro only
          attribs[ :m ] = true    
        elsif value =~ /^supra$/   ## supra(national)
          attribs[ :c ] = false   # turn off default c|country flag; make it s|supra only
          attribs[ :s ] = true
        elsif value =~ /^supra:/   ## supra:
          value_country_key = value[6..-1]  ## cut off supra: prefix
          value_country = Country.find_by_key!( value_country_key )
          attribs[ :country_id ] = value_country.id
        elsif value =~ /^country:/   ## country:
          value_country_key = value[8..-1]  ## cut off country: prefix
          value_country = Country.find_by_key!( value_country_key )
          attribs[ :country_id ] = value_country.id
          attribs[ :c ] = false # turn off default c|country flag; make it d|depend only
          attribs[ :d ] = true  
        elsif value =~ /^metro:/   ## metro:
          value_city_key = value[6..-1]  ## cut off metro: prefix
          value_city = City.find_by_key!( value_city_key )
          attribs[ :city_id ] = value_city.id
        elsif value =~ /^city:/   ## city:
          value_city_key = value[5..-1]  ## cut off city: prefix
          value_city = City.find_by_key!( value_city_key )
          attribs[ :city_id ] = value_city.id
          attribs[ :c ] = false # turn off default c|city flag; make it d|district only
          attribs[ :d ] = true  
        elsif value =~ /^m:/   ## m:
          value_popm_str = value[2..-1]  ## cut off m: prefix
          value_popm = value_popm_str.gsub(/[ _]/, '').to_i
          attribs[ :popm ] = value_popm
          attribs[ :m ] = true   #  auto-mark city as m|metro too
        elsif value =~ /^[A-Z]{2,3}$/  ## assume two or three-letter code
          attribs[ :code ] = value
        elsif value =~ /(^[0-9]{1,2}$)|(^[0-9][0-9 _]+[0-9]$)/    ## numeric (nb: can use any _ or spaces inside digits e.g. 1_000_000 or 1 000 000)
          value_numbers << value.gsub(/[ _]/, '').to_i
        elsif (values.size==(index+1)) && value =~ /^[a-z0-9\|_ ]+$/   # tags must be last entry

          puts "   found tags: >>#{value}<<"

          tag_keys = value.split('|')
  
          ## unify; replace _w/ space; remove leading n trailing whitespace
          tag_keys = tag_keys.map do |key|
            key = key.gsub( '_', ' ' )
            key = key.strip
            key
          end
          
          value_tag_keys += tag_keys
        else
          # issue warning: unknown type for value
          puts "!!!! >>>> warning: unknown type for value >#{value}<"
        end
      end
      
      if value_numbers.size > 0
        if clazz == City
          attribs[ :pop  ] = value_numbers[0]   # assume first number is pop for cities
          attribs[ :area ] = value_numbers[1]  
        else   # countries,regions
          attribs[ :area ] = value_numbers[0]
          attribs[ :pop  ] = value_numbers[1]
        end
      end

      rec = nil
      
      if clazz == Region  ## requires country_id
        ## todo: assert that country_id is present/valid, that is, NOT null
        rec = clazz.find_by_key_and_country_id( attribs[ :key ], attribs[ :country_id] )
      else
        rec = clazz.find_by_key( attribs[ :key ] )
      end

      if rec.present?
        ## nb: [17..-1] cut off WorldDB::Models:: in name
        puts "*** update #{clazz.name[17..-1].downcase} #{rec.id}-#{rec.key}:"
      else
        puts "*** create #{clazz.name[17..-1].downcase}:"
        rec = clazz.new
      end
      
      puts attribs.to_json
   
      rec.update_attributes!( attribs )
      
      ##################
      ## add taggings 

      if value_tag_keys.size > 0

        value_tag_keys.uniq!  # remove duplicates
        puts "   adding #{value_tag_keys.size} taggings: >>#{value_tag_keys.join('|')}<<..."

        ### fix/todo: check tag_ids and only update diff (add/remove ids)

        value_tag_keys.each do |key|
          tag = Tag.find_by_key( key )
          if tag.nil?  # create tag if it doesn't exit
            puts "   creating tag >#{key}<"
            tag = Tag.create!( key: key )
          end
          rec.tags << tag
        end
      end

        
    end # each_line
            
  end # method load_fixture_worker_for

  
end # class Reader
end # module WorldDB

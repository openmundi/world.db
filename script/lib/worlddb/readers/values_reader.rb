# encoding: utf-8

class ValuesReader

  def initialize( logger, path, more_values={} )
    ## todo: check - can we make logger=nil a default arg too?
    if logger.nil?
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::INFO
    else
      @logger = logger
    end
    
    @path = path

    @more_values = more_values

    @data = File.read_utf8( @path )
  end

  attr_reader :logger
  
  def each_line
   
    @data.each_line do |line|
  
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


      # pass 1) remove possible trailing eol comment
      ##  e.g    -> nyc, New York   # Sample EOL Comment Here (with or without commas,,,,)
      ## becomes -> nyc, New York

      line = line.sub( /\s+#.+$/, '' )

      # pass 2) remove leading and trailing whitespace
      
      line = line.strip

      puts "line: >>#{line}<<"

      values = line.split(',')
      
      # pass 1) remove leading and trailing whitespace for values

      values = values.map { |value| value.strip }

      ##### todo remove support of comment column? (NB: must NOT include commas)
      # pass 2) remove comment columns
      
      values = values.select do |value|
        if value =~ /^#/  ## start with # treat it as a comment column; e.g. remove it
          puts "   removing column with value >>#{value}<<"
          false
        else
          true
        end
      end
      
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
      
      attribs = attribs.merge( @more_values )  # e.g. merge country_id and other defaults if present
                        
      yield( attribs, values[2..-1] )

    end # each lines

  end # method each_line
  
end # class ValuesReader


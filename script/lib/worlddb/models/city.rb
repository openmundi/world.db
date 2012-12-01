# encoding: utf-8

module WorldDB::Models

class City < ActiveRecord::Base
  self.table_name = 'cities'

  belongs_to :country, :class_name => 'Country', :foreign_key => 'country_id'
  belongs_to :region,  :class_name => 'Region',  :foreign_key => 'region_id'

  ## self referencing hierachy within cities e.g. m|metro > c|city > d|district

  ## fix: use condition check for m|d|c flag?? why? why not? (NB: flags are NOT exclusive e.g. possible metro|city)
  
  ## (1) metro - level up
  has_many   :cities,    :class_name => 'City', :foreign_key => 'city_id'

  ## (2) city
  belongs_to :metro,     :class_name => 'City', :foreign_key => 'city_id'   ## for now alias for parent - use parent?
  has_many   :districts, :class_name => 'City', :foreign_key => 'city_id'   ## for now alias for cities - use cities?

  ## (3) district - level down
  belongs_to :city,      :class_name => 'City', :foreign_key => 'city_id'  ## for now alias for parent - use parent?


  ###
  #  NB: use is_  for flags to avoid conflict w/ assocs (e.g. metro?, city? etc.)
  
  def is_metro?
    m? == true
  end
  
  def is_city?
    c? == true
  end
  
  def is_district?
    d? == true
  end

  
  has_many :taggings, :as => :taggable
  has_many :tags,  :through => :taggings

  validates :key, :format => { :with => /^[a-z]{3,}$/, :message => 'expected three or more lowercase letters a-z' }
  validates :code, :format => { :with => /^[A-Z_]{3}$/, :message => 'expected three uppercase letters A-Z (and _)' }, :allow_nil => true

  scope :by_key,    order( 'key asc' )    # order by key (a-z)
  scope :by_title,  order( 'title asc' )  # order by title (a-z)
  scope :by_pop,    order( 'pop desc' )   # order by pop(ulation)
  scope :by_popm,   order( 'popm desc' )  # order by pop(ulation) metropolitan area
  scope :by_area,   order( 'area desc' )  # order by area (in square km)

  def title_w_synonyms
    return title if synonyms.blank?
    
    buf = ''
    buf << title
    buf << ' | '
    buf << synonyms.split('|').join(' | ')
    buf
  end


  def self.create_from_ary!( cities, more_values={} )
    cities.each do |values|
      
      ## key & title & country required
      attr = {
        key: values[0]
      }
      
      ## title (split of optional synonyms)
      # e.g. FC Bayern Muenchen|Bayern Muenchen|Bayern
      titles = values[1].split('|')
      
      attr[ :title ]    =  titles[0]
      ## add optional synonyms
      attr[ :synonyms ] =  titles[1..-1].join('|')  if titles.size > 1
      
      attr = attr.merge( more_values )
      
      value_numbers = []
      
      ## check for optional values
      values[2..-1].each do |value|
        if value.is_a? Country
          attr[ :country_id ] = value.id
        elsif value.is_a? Numeric
          value_numbers << value
        elsif value =~ /^[A-Z_]{3}$/    ## assume its three letter code (e.g. NYC,VIE,etc.)
          attr[ :code ] = value
        elsif value =~ /^region:/   ## region:
          value_region_key = value[7..-1]  ## cut off region: prefix
          value_region = Region.find_by_key!( value_region_key )
          attr[ :region_id ] = value_region.id
        else
          # issue warning: unknown type for value
        end
      end
      
      if value_numbers.size > 0
        attr[ :pop  ] = value_numbers[0]
        attr[ :area ] = value_numbers[1]
      end

      
      City.create!( attr )
    end # each city
  end

end # class Cities

end # module WorldDB::Models
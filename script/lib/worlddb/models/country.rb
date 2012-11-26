# encoding: utf-8

module WorldDB::Models

class Country < ActiveRecord::Base
  self.table_name = 'countries'

  has_many :regions, :class_name => 'Region', :foreign_key => 'country_id'
  has_many :cities,  :class_name => 'City',   :foreign_key => 'country_id'
  
  ## self referencing hierachy within countries e.g. EU > GB > EN
  belongs_to :parent,    :class_name => 'Country', :foreign_key => 'country_id'
  has_many   :countries, :class_name => 'Country', :foreign_key => 'country_id'

  has_many :taggings, :as => :taggable
  has_many :tags,     :through => :taggings

  validates :key, :format => { :with => /^[a-z]{2}$/, :message => 'expected two lowercase letters a-z' }
  validates :code, :format => { :with => /^[A-Z_]{3}$/, :message => 'expected three uppercase letters A-Z (and _)' }

  def self.by_key  # order by key (a-z)
    self.order( 'key asc' )
  end

  def self.by_title  # order by title (a-z)
    self.order( 'title asc' )
  end
  
  def self.by_pop  # order by pop(ulation)
    self.order( 'pop desc' )
  end
  
  def self.by_area  # order by area (in square km)
    self.order( 'area desc')
  end

  def title_w_synonyms
    return title if synonyms.blank?
    
    buf = ''
    buf << title
    buf << ' | '
    buf << synonyms.split('|').join(' | ')
    buf
  end


  def self.create_from_ary!( countries )
    countries.each do |values|
      
      ## key & title required
      attr = {
        :key   => values[0],
        :title => values[1],
        :code  => values[2]
      }
      
      value_numbers = []
      
      ## check for optional values
      values[3..-1].each do |value|
        if value.is_a? Numeric
          value_numbers << value
        elsif value =~ /^motor:/  
          value_motor = value[6..-1]  ## cut off region: motor
          attr[ :motor ] = value_motor
        elsif value =~ /^tags:/   
          value_tags = value[5..-1]  ## cut off tags: prefix
          # do nothing now
        else
          # issue warning: unknown type for value
        end
      end
      
      if value_numbers.size > 0
        attr[ :area ] = value_numbers[0]  # NB: area for countries goes first
        attr[ :pop  ] = value_numbers[1]
      end
      
      
      
      Country.create!( attr )
    end # each country
  end

end # class Country


end # module WorldDB::Models
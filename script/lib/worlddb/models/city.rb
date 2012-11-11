# encoding: utf-8

module WorldDB::Models

class City < ActiveRecord::Base
  self.table_name = 'cities'

  belongs_to :country, :class_name => 'Country', :foreign_key => 'country_id'
  belongs_to :region,  :class_name => 'Region',  :foreign_key => 'region_id'
  
  has_many :taggings, :as => :taggable
  has_many :tags,  :through => :taggings
  
  
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
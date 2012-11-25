module WorldDB::Models

class Region < ActiveRecord::Base

  belongs_to :country, :class_name => 'Country', :foreign_key => 'country_id'

  has_many :cities, :class_name => 'City', :foreign_key => 'region_id'

  has_many :taggings, :as => :taggable
  has_many :tags,     :through => :taggings

  validates :key, :format => { :with => /^[a-z]{2,}$/, :message => 'expected two or more lowercase letters a-z' }
  validates :code, :format => { :with => /^[A-Z_]{2,3}$/, :message => 'expected two or three uppercase letters A-Z (and _)' }, :allow_nil => true


  def title_w_synonyms
    return title if synonyms.blank?
    
    buf = ''
    buf << title
    buf << ' | '
    buf << synonyms.split('|').join(' | ')
    buf
  end


  def self.create_from_ary!( regions, more_values={} )
    regions.each do |values|
            
      ## key & title & country required
      attr = {
        key:   values[0],
        title: values[1]
      }

      attr = attr.merge( more_values )
      
      ## check for optional values
      values[2..-1].each do |value|
        if value.is_a? Country
          attr[ :country_id ] = value.id
        else
          # issue warning: unknown type for value
        end
      end
      
      Region.create!( attr )
    end # each region
  end

end # class Region

end # module WorldDB::Models
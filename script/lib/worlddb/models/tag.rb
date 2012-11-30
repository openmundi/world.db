# encoding: utf-8

module WorldDB::Models

  class Tag < ActiveRecord::Base
    
    has_many :taggings
    
    has_many :cities,    :through => :taggings, :source => :taggable, :source_type => 'WorldDB::Models::City',    :class_name => 'City'
    has_many :countries, :through => :taggings, :source => :taggable, :source_type => 'WorldDB::Models::Country', :class_name => 'Country'
    has_many :regions,   :through => :taggings, :source => :taggable, :source_type => 'WorldDB::Models::Region',  :class_name => 'Region'

    ## fix/todo: improve regex use   [a-z][a-z0-9] | [a-z][a-z0-9_ ]+[a-z0-9] to only allow spaces and underscore inbetween; do not allow digit as first char 
    validates :key, :format => { :with => /^[a-z0-9_ ]{2,}$/, :message => 'expected two or more lowercase letters a-z or 0-9 digits or space or underscore' }

    scope :by_key,   order( 'key desc' )
    scope :by_title, order( 'title desc' )
    
    before_save :on_before_save

    def on_before_save
      # replace space with underscore e.g. north america becomes north_america and so on
      self.slug = key.gsub( ' ', '_' )
    end
      
  end  # class Tag
  
end # module WorldDB::Models

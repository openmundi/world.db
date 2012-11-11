# encoding: utf-8

module WorldDB::Models

  class Tag < ActiveRecord::Base
    
    has_many :taggings
    
    has_many :cities,    :through => :taggings, :source => :taggable, :source_type => 'WorldDB::Models::City',    :class_name => 'City'
    has_many :countries, :through => :taggings, :source => :taggable, :source_type => 'WorldDB::Models::Country', :class_name => 'Country'
    has_many :regions,   :through => :taggings, :source => :taggable, :source_type => 'WorldDB::Models::Region',  :class_name => 'Region'
    
  end  # class Tag
  
end # module WorldDB::Models

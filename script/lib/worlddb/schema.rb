
module WorldDB

class CreateDB

  include WorldDB::Models


def self.up

  ActiveRecord::Schema.define do

create_table :countries do |t|
  t.string  :title,  :null => false
  t.string  :key,    :null => false
  t.string  :code,   :null => false  # short three letter code (FIFA country code e.g. ITA)
  t.string  :synonyms  # comma separated list of synonyms
  t.integer :pop,    :null => false    # population count
  t.integer :area,   :null => false    #  area in square km (sq. km)
  t.references :country  # for supra(nationals) n depend(encies)
  
  ## flags (use single int named flags - why? why not?  
  t.boolean :s,  :null => false, :default => false   # supra(national) flag e.g. eu
  t.boolean :c,  :null => false, :default => false   # country flag (is this needed?)
  t.boolean :d,  :null => false, :default => false   # dependency flag
 
  # extras
  t.string  :motor      # optional auto motor (vehicle) licene plate
  t.string  :iso2       # optional iso two letter country code
  t.string  :iso3       # optional iso three letter country code
  t.string  :fifa       # optional fifa country code
  t.string  :net        # optional internet top level domain (tld)
  t.string  :wikipedia  # optional wikipedia page name -- en.wikipedia.org/wiki/<name>

  ## timestamp at last
  t.timestamps
end


add_index :countries, :key,  :unique => true
add_index :countries, :code, :unique => true


create_table :regions do |t|
  t.string :title,  :null => false
  t.string :key,    :null => false
  t.string :code     # short two or three letter code e.g. NY, OAX, etc.
  t.string :synonyms  # comma separated list of synonyms
  t.references :country, :null => false
  t.integer :pop     # optional population count
  t.integer :area    # optional area in square km (sq. km)
  t.timestamps
end

add_index :regions, [:key, :country_id], :unique => true


create_table :cities do |t|
  t.string :title, :null => false
  t.string :key,   :null => false
  t.string :code     # short three letter code (ITAT/airport code e.g. NYC or VIE)
  t.string :synonyms  # comma separated list of synonyms
  t.references :country,  :null => false
  t.references :region    # optional for now
  t.references :city  # optional parent (e.g. metro for city, or city for district)
  t.integer :pop     # optional population count (city proper)
  t.integer :popm    # optional population count (metropolitan/aglomeration)
  t.integer :area    # optional area in square km (sq. km)
  t.float   :lat   # optional for now
  t.float   :lng   # optional for now

  ## flags (use single int named flags - why? why not?    
  t.boolean :m,  :null => false, :default => false   # metro flag
  t.boolean :c,  :null => false, :default => false   # city flag (is this needed?)
  t.boolean :d,  :null => false, :default => false   # district flag

  ### t.boolean :capital, :null => false, :default => false  # is national captial?
  
  t.timestamps
end

create_table :tags do |t|
  t.string :key,  :null => false
  t.string :slug, :null => false
  t.string :title    # todo: make required? 
  ## todo: add parent or similar for hierachy (for tag stacks/packs)
  t.timestamps
end

add_index :tags, :key,  :unique => true

create_table :taggings do |t|
  t.references :tag,  :null => false
  t.references :taggable, :polymorphic => true
  t.timestamps   # todo: use only t.datetime :created_at (do we get ar magic? is updated used/needed??)
end

add_index :taggings, :tag_id
add_index :taggings, [:taggable_id, :taggable_type]


create_table :props do |t|
  t.string :key,   :null => false
  t.string :value, :null => false
  t.timestamps
end

  end # block Schema.define

  Prop.create!( key: 'db.schema.world.version', value: WorldDB::VERSION )

end # method up

end # class CreateDB

end # module WorldDB
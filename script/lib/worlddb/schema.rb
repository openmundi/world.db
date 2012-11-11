
module WorldDB

class CreateDB

  include WorldDB::Models


def self.up

  ActiveRecord::Schema.define do

create_table :countries do |t|
  t.string  :title, :null => false
  t.string  :key,   :null => false
  t.string  :tag,   :null => false  # short three letter tag (FIFA country code)
  t.string  :synonyms  # comma separated list of synonyms
  t.string  :motor   # optional auto motor (vehicle) licene plate
  t.integer :pop     # optional population count
  t.integer :area    # optional area in square km (sq. km)
  t.timestamps
end

create_table :regions do |t|
  t.string :title,  :null => false
  t.string :key,    :null => false
  t.string :synonyms  # comma separated list of synonyms
  t.references :country, :null => false
  t.integer :pop     # optional population count
  t.integer :area    # optional area in square km (sq. km)
  t.timestamps
end

create_table :cities do |t|
  t.string :title, :null => false
  t.string :key,   :null => false
  t.string :synonyms  # comma separated list of synonyms
  t.references :country,  :null => false
  t.references :region    # optional for now
  t.integer :pop     # optional population count
  t.integer :area    # optional area in square km (sq. km)
  t.boolean :capital, :null => false, :default => false  # is national captial?
  t.timestamps
end

create_table :tags do |t|
  t.string :key,  :null => false
  t.string :title    # todo: make required? 
  ## todo: add parent or similar for hierachy (for tag stacks/packs)
  t.timestamps
end

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
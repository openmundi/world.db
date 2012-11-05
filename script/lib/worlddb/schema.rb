
module WorldDB

class CreateDB

  include WorldDB::Models


def self.up

  ActiveRecord::Schema.define do

create_table :countries do |t|
  t.string :title, :null => false
  t.string :key,   :null => false
  t.string :tag,   :null => false  # short three letter tag (FIFA country code)
  t.string :synonyms  # comma separated list of synonyms
  t.timestamps
end

create_table :regions do |t|
  t.string :title,  :null => false
  t.string :key,    :null => false
  t.string :synonyms  # comma separated list of synonyms
  t.references :country, :null => false
  t.timestamps
end

create_table :cities do |t|
  t.string :title, :null => false
  t.string :key,   :null => false
  t.string :synonyms  # comma separated list of synonyms
  t.references :country,  :null => false
  t.references :region    # optional for now
  t.timestamps
end

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
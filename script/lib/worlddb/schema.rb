
module WorldDB

class CreateDB

  ## include WorldDB::Models


def self.up

  ActiveRecord::Schema.define do

create_table :countries do |t|
  t.string :title, :null => false
  t.string :tag,   :null => false  # short three letter tag
  t.string :key,   :null => false
  t.timestamps
end
    
  end # block Schema.define

  ## Prop.create!( key: 'db.schema.version', value: BeerDB::VERSION )

end # method up

end # class CreateDB

end # module WorldDB
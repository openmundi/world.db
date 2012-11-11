# encoding: utf-8

module WorldDB::Models

  class Tagging < ActiveRecord::Base

    belongs_to :tag
    belongs_to :taggable, :polymorphic => true

  end  # class Tagging

end # module WorldDB::Models

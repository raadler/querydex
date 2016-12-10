#Type data come from ipokedexdb.

class Type < ActiveRecord::Base
  validates :name, presence: true
  validates :color, presence: true
end

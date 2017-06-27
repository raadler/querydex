# Type data come from ipokedexdb.

class Type < ActiveRecord::Base
  validates :name, presence: true
  has_many :primary_pokemons, class_name: 'Pokemon', foreign_key: 'type_1_id'
  has_many :secondary_pokemons, class_name: 'Pokemon', foreign_key: 'type_2_id'
end

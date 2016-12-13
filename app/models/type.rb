# Type data come from ipokedexdb.

class Type < ActiveRecord::Base
  validates :name, presence: true
  validates :color, presence: true
  has_many :pokemons, through: :pokemon_types
  has_many :pokemon_types
end

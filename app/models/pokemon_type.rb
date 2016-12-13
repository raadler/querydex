# Join table for Pokemon and Type

class PokemonType < ActiveRecord::Base
  validates :pokemon_id, presence: true
  validates :type_id, presence: true
  belongs_to :pokemon
  belongs_to :type
end

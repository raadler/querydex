class AddTimestampsToPokemon < ActiveRecord::Migration
  def change
    add_column(:pokemons, :created_at, :datetime)
    add_column(:pokemons, :updated_at, :datetime)
  end
end

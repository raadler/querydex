class RemoveBulbImageFromPokemon < ActiveRecord::Migration
  def up
    remove_column(:pokemons, :bulbapedia_image)
  end
  def down
    add_column(:pokemons, :bulbapedia_image, :string)
  end
end

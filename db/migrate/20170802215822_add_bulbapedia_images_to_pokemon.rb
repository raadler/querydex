class AddBulbapediaImagesToPokemon < ActiveRecord::Migration
  def change
    add_column(:pokemons, :bulbapedia_image, :string)
  end
end

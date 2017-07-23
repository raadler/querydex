class AddBulbapediaToPokemons < ActiveRecord::Migration
  def change
    add_column(:pokemons, :bulbapedia_link, :string)
    add_column(:pokemons, :bulbapedia_image, :string)
  end
end

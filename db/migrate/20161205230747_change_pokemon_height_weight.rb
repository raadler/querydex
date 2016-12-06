class ChangePokemonHeightWeight < ActiveRecord::Migration
  def up
    change_column :pokemons, :height, :float
    change_column :pokemons, :weight, :float
  end

  def down
    change_column :pokemons, :height, :integer
    change_column :pokemons, :weight, :integer
  end
end

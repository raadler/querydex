class AddTypesToPokemons < ActiveRecord::Migration
  def change
    add_reference :pokemons, :type_1
    add_reference :pokemons, :type_2
  end
end

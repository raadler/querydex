class QueriesController < ApplicationController
  def find_single_pokemon_by_name
    @pokemon = Pokemon.find_by(name: "Charizard")
  end
  def list_all_pokemon_by_name_and_ndex
    @pokemons = Pokemon.all.select("name, ndex").order(:ndex).to_a
  end
  def find_all_pokemon_of_type_1_and_type_2
    # Pokemon.where("type_1_id = 7 AND type_2_id = 3")
    type_1 = Type.find_by(name: 'Bug')
    type_2 = Type.find_by(name: 'Flying')
    @pokemons = Pokemon.where(type_1: type_1, type_2: type_2).to_a
  end
  def index
    @queries = {
      "Find a pokemon by name" => find_single_pokemon_by_name_path,
      "List pokemon by name with national pokedex id" => list_all_pokemon_by_name_and_ndex_path,
      "Find pokemon by types" => find_all_pokemon_of_type_1_and_type_2_path
    }
  end
  def show
  end
end

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

  def find_all_pokemon_of_type_1_or_type_2
    type_a = Type.find_by(name: 'Bug')
    type_b = Type.find_by(name: 'Flying')
    bug_first = Pokemon.where(type_1: type_a).to_a
    bug_second = Pokemon.where(type_2: type_a).to_a
    flying_first = Pokemon.where(type_1: type_b).to_a
    flying_second = Pokemon.where(type_2: type_b).to_a
    @pokemons = bug_first + bug_second + flying_first + flying_second
  end

  def easiest_to_catch
    by_catch_rate = Pokemon.order(catch_rate: :desc).to_a
    easiest_rate = by_catch_rate.first.catch_rate
    @pokemons = Pokemon.where(catch_rate: easiest_rate).to_a
  end
  def index
    @queries = {
      "Find a pokemon by name" => find_single_pokemon_by_name_path,
      "List pokemon by name with national pokedex id" => list_all_pokemon_by_name_and_ndex_path,
      "Find pokemon by two types" => find_all_pokemon_of_type_1_and_type_2_path,
      "Find pokemon of either of two types" => find_all_pokemon_of_type_1_or_type_2_path,
      "Find all the easiest to catch pokemon" => easiest_to_catch_path
    }
  end
  def show
  end
end

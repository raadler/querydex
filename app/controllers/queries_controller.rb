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

  def top_10_easiest_to_catch
    by_catch_rate = Pokemon.order(catch_rate: :desc).to_a
    easiest_rate = by_catch_rate.first.catch_rate
    all_easiest = Pokemon.where(catch_rate: easiest_rate)
    @pokemons = all_easiest.order(weight: :desc).limit(10).to_a
  end

  def easiest_type_to_catch_avg
    type_names = ["Normal", "Fighting", "Flying", "Poison", "Ground", "Rock", "Bug", "Ghost", "Steel", "Fire", "Water", "Grass", "Electric", "Psychic", "Ice", "Dragon", "Dark"]
    type_averages = {}
    type_names.each_with_index do |name, index|
      type_averages[name] = Pokemon.where("type_1_id = #{index} OR type_2_id = #{index}").average("catch_rate").to_i
    end
    @type_sorted = type_averages.sort_by {|key, value| value}
    @easiest_to_catch_type_name = @type_sorted.last[0]
    @easiest_to_catch_type_average = @type_sorted.last[1]
  end

  def random_pokemon_with_good_catch_rate
    @pokemon = Pokemon.select(:name, :catch_rate, :ndex, :bulbapedia_link).where("catch_rate >= 225").sample
  end

  def index
    @queries = {
      "Find a pokemon by name" => find_single_pokemon_by_name_path,
      "List pokemon by name with national pokedex id" => list_all_pokemon_by_name_and_ndex_path,
      "Find pokemon by two types" => find_all_pokemon_of_type_1_and_type_2_path,
      "Find pokemon of either of two types" => find_all_pokemon_of_type_1_or_type_2_path,
      "Find all the easiest to catch pokemon" => easiest_to_catch_path,
      "Top 10 easiest to catch pokemon" => top_10_easiest_to_catch_path,
      "Easiest type of pokemon to catch" => easiest_type_to_catch_avg_path,
      "A random pokemon with a good catch rate" => random_pokemon_with_good_catch_rate_path
    }
  end
  def show
  end
end

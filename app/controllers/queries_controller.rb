class QueriesController < ApplicationController
  def find_single_pokemon_by_name
    @pokemon = Pokemon.find_by(name: "Charizard")
  end

  def list_all_pokemon_by_name_and_ndex
    @pokemons = Pokemon.select("name, ndex").order(:ndex)
  end

  def find_all_pokemon_of_type_1_and_type_2
    type_1 = Type.find_by(name: 'Bug')
    type_2 = Type.find_by(name: 'Flying')
    @pokemons = Pokemon.where(type_1: type_1, type_2: type_2).order(:ndex)
  end

  def find_all_pokemon_of_type_1_or_type_2
    type_a = Type.find_by(name: 'Bug')
    type_b = Type.find_by(name: 'Flying')
    bug_first = Pokemon.where(type_1: type_a)
    bug_second = Pokemon.where(type_2: type_a)
    flying_first = Pokemon.where(type_1: type_b)
    flying_second = Pokemon.where(type_2: type_b)
    @pokemons = bug_first + bug_second + flying_first + flying_second
  end

  def easiest_to_catch
    easiest_rate = by_catch_rate = Pokemon.order(catch_rate: :desc).first.catch_rate
    @pokemons = Pokemon.where(catch_rate: easiest_rate)
  end

  def top_10_easiest_to_catch
    easiest_rate = by_catch_rate = Pokemon.order(catch_rate: :desc).first.catch_rate
    all_easiest = Pokemon.where(catch_rate: easiest_rate)
    @pokemons = all_easiest.order(weight: :desc).limit(10)
  end

  def easiest_type_to_catch_avg
    type_names = Type.pluck(:name)
    type_averages = {}
    type_names.each_with_index do |name, index|
      type_averages[name] = Pokemon.where("type_1_id = #{index + 1} OR type_2_id = #{index + 1}").average("catch_rate").to_i
    end
    @type_sorted = type_averages.sort_by {|key, value| value}
    @easiest_to_catch_type_name = @type_sorted.last[0]
    @easiest_to_catch_type_average = @type_sorted.last[1]
  end

  def random_pokemon_with_good_catch_rate
    @pokemon = Pokemon.select(:name, :catch_rate, :ndex, :bulbapedia_link).where("catch_rate >= 225").sample
  end

  def exp_for_3_pokemon_to_reach_lvl_100
    @pokemon1 = Pokemon.find_by(name: 'Bulbasaur')
    @pokemon2 = Pokemon.find_by(name: 'Charmander')
    @pokemon3 = Pokemon.find_by(name: 'Squirtle')
    @poke_sum = @pokemon1.lvl_100_exp + @pokemon2.lvl_100_exp + @pokemon3.lvl_100_exp
  end

  def first_10_pokemon_of_gen_2_by_ndex
    @pokemons = Pokemon.where(gen_id: 2).order(:ndex).limit(10)
  end

  def all_not_seed_pokemon
    @pokemons = Pokemon.where.not(species: "Seed").order(:ndex)
  end
  def number_of_primary_pokemon_of_each_type
    total_hash = Pokemon.order(:type_1_id).group(:type_1_id).count
    types = Type.pluck(:name)
    #The above gets us the result we want, but this way the type names are the keys
    @totals = {}
    total_hash.each do |type_id, total|
      @totals[types[type_id -1]] = total
    end
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
      "A random pokemon with a good catch rate" => random_pokemon_with_good_catch_rate_path,
      "Exp for 3 pokemon to reach level 100" => exp_for_3_pokemon_to_reach_lvl_100_path,
      "The first 10 pokemon of generation 2, by national dex" => first_10_pokemon_of_gen_2_by_ndex_path,
      "All the pokemon whose species isn't seed" => all_not_seed_pokemon_path,
      "Number of Pokemon of with each type as primary" => number_of_primary_pokemon_of_each_type_path
    }
  end
end

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
    @pokemons = Pokemon.where("type_1_id = ? OR type_2_id = ? OR type_1_id = ? OR type_2_id = ?", 7,7,3,3).order(:ndex)
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
    @poke_sum = Pokemon.where(name: ["Bulbasaur","Charmander", "Squirtle"]).sum(:lvl_100_exp)
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

  def five_random_female_male_genderless
    @female = Pokemon.where(gender_rate: 8).sample(5)
    @male = Pokemon.where(gender_rate: 0).sample(5)
    @genderless = Pokemon.where(gender_rate: -1).sample(5)
  end

  def all_pokemon_with_longest_name
    longest_length = Pokemon.order("LENGTH(name) DESC").first.name.length
    @all_longest = Pokemon.where("LENGTH(name) = #{longest_length}")
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
      "Number of Pokemon of with each type as primary" => number_of_primary_pokemon_of_each_type_path,
      "Five random female, male, and genderless pokemon" => five_random_female_male_genderless_path,
      "Pokemon with the longest names(s)" => all_pokemon_with_longest_name_path
    }
  end
end

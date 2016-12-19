# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class Integer
  def to_b
    !self.zero?
  end
end

pokefile = File.read("pokefile.json")
parsed_pokemon = JSON.parse(pokefile)
parsed_pokemon["pokemon"].each do |pokemon|
  Pokemon.create({name: pokemon["name"],
     species: pokemon["species"],
     gen_id: pokemon["generation_id"].to_i,
     ndex: pokemon["ndex"].to_i,
     height: pokemon["height"].to_i,
     weight: pokemon["weight"].to_i,
     gender_rate: pokemon["gender_rate"].to_i,
     catch_rate: pokemon["catch_rate"].to_i,
     exp_yield: pokemon["exp_yield"].to_i,
     base_happiness: pokemon["base_happiness"].to_i,
     egg_group1: pokemon["egg_group1_id"].to_i,
     egg_group2: pokemon["egg_group2_id"].to_i,
     is_baby: pokemon["is_baby"].to_i.to_b,
     hatch_counter: pokemon["hatch_counter"].to_i,
     lvl_100_exp: pokemon["lvl_100_exp"].to_i,
     type_1_id: pokemon["type1_id"].to_i,
     type_2_id: pokemon["type2_id"].to_i})
end
# Pokemon.create([{name: 'Bulbasaur', species: 'seed', gen_id: 1, ndex: 1, height: 4, weight: 4, gender_rate: 3, catch_rate: 10, exp_yield: 100, base_happiness: 70, egg_group1: 4, is_baby: false, hatch_counter: 20, lvl_100_exp: 50000, type_1_id: 2}])

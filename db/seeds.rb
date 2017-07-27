require 'csv'

class Integer
  def to_b
    !self.zero?
  end
end

pokefile = File.read("pokefile.json")
parsed_pokemon = JSON.parse(pokefile)
parsed_pokemon["pokemon"].each do |pokemon|
created_pokemon = Pokemon.create({name: pokemon["name"],
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
   type_2_id: pokemon["type2_id"].to_i,
   })
end

Pokemon.all.each do |pokemon|
  pokemon.update(bulbapedia_link: "https://bulbapedia.bulbagarden.net/wiki/#{pokemon.name}_(Pok%C3%A9mon)")
end


CSV.foreach("typefile.csv", :headers => true) do |type|
  created_types = Type.create({name: type[1]})
end

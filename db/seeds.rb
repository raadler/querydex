require 'csv'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

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

#Add the Bulbapedia links to the pokemon
Pokemon.all.each do |pokemon|
  pokemon.update(bulbapedia_link: "https://bulbapedia.bulbagarden.net/wiki/#{pokemon.name}_(Pok%C3%A9mon)")
end

#Add the Bulbapedia images to the pokemon
# Pokemon.all.each do |pokemon|
#   number_fixed = "%03d" % pokemon.ndex
#   name_fixed = pokemon.name.delete!("^\u{0000}-\u{007F}")
#   page = Nokogiri::HTML(open("https://bulbapedia.bulbagarden.net/wiki/File:#{number_fixed}#{name_fixed}.png"))
#   image = page.css("#mw-content-text").css('a').css('img')[0]["src"]
#   pokemon.update(bulbapedia_image: "https:#{image}")
# end


CSV.foreach("typefile.csv", :headers => true) do |type|
  created_types = Type.create({name: type[1]})
end

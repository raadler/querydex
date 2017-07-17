Pokemon.where(name: "Charizard")
Pokemon.all.select("name, ndex").order(:ndex)
Pokemon.where("type_1_id = 7 AND type_2_id = 3")

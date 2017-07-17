Pokemon.where(name: "Charizard")
Pokemon.all.select("name, ndex").order(:ndex)

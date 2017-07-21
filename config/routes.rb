Rails.application.routes.draw do
  root 'queries#index'
  resources :queries
  get '/find_single_pokemon_by_name', to: 'queries#find_single_pokemon_by_name'
  get '/list_all_pokemon_by_name_and_ndex', to: 'queries#list_all_pokemon_by_name_and_ndex'
  get '/find_all_pokemon_of_type_1_and_type_2', to: 'queries#find_all_pokemon_of_type_1_and_type_2'
end

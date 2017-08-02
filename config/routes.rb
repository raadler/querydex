Rails.application.routes.draw do
  root 'queries#index'
  resources :queries
  get '/find_single_pokemon_by_name', to: 'queries#find_single_pokemon_by_name'
  get '/list_all_pokemon_by_name_and_ndex', to: 'queries#list_all_pokemon_by_name_and_ndex'
  get '/find_all_pokemon_of_type_1_and_type_2', to: 'queries#find_all_pokemon_of_type_1_and_type_2'
  get '/find_all_pokemon_of_type_1_or_type_2', to: 'queries#find_all_pokemon_of_type_1_or_type_2'
  get '/easiest_to_catch', to: 'queries#easiest_to_catch'
  get '/top_10_easiest_to_catch', to: 'queries#top_10_easiest_to_catch'
  get '/easiest_type_to_catch_avg', to: 'queries#easiest_type_to_catch_avg'
  get '/random_pokemon_with_good_catch_rate', to: 'queries#random_pokemon_with_good_catch_rate'
  get '/exp_for_3_pokemon_to_reach_lvl_100', to: 'queries#exp_for_3_pokemon_to_reach_lvl_100'
  get '/first_10_pokemon_of_gen_2_by_ndex', to: 'queries#first_10_pokemon_of_gen_2_by_ndex'
  get '/all_not_seed_pokemon', to: 'queries#all_not_seed_pokemon'
  get '/number_of_primary_pokemon_of_each_type', to: 'queries#number_of_primary_pokemon_of_each_type'
  get '/five_random_female_male_genderless', to: 'queries#five_random_female_male_genderless'
  get '/all_pokemon_with_longest_name', to: 'queries#all_pokemon_with_longest_name'
end

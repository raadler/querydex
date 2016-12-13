require 'rails_helper'

describe PokemonType do
  it { should have_valid(:pokemon_id).when(2) }
  it { should_not have_valid(:pokemon_id).when(nil, '') }

  it { should have_valid(:type_id).when(2) }
  it { should_not have_valid(:type_id).when(nil, '') }
end

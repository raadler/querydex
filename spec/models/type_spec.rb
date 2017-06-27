require 'rails_helper'

RSpec.describe Type, type: :model do
  describe 'associations' do
    it do
      should have_many(:primary_pokemons).class_name('Pokemon')
        .with_foreign_key('type_1_id')
    end
    it do
      should have_many(:secondary_pokemons).class_name('Pokemon')
        .with_foreign_key('type_2_id')
    end
  end

  it { should have_valid(:name).when('Ghost') }
  it { should_not have_valid(:name).when(nil, '') }
end

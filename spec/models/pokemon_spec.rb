require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  describe 'associations' do
    it { should belong_to(:type_1).class_name('Type') }
    it { should belong_to(:type_2).class_name('Type') }
  end

  it { should have_valid(:name).when('Gourgeist') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:species).when('Pumpkin') }
  it { should_not have_valid(:species).when(nil, '') }

  it { should have_valid(:gen_id).when(6) }
  it { should_not have_valid(:gen_id).when(nil, 'six', 6.7) }

  it { should have_valid(:ndex).when(711) }
  it { should_not have_valid(:ndex).when(nil, 'seven eleven', 828.3) }

  it { should have_valid(:height).when(0.9) }
  it { should_not have_valid(:height).when(nil, 'very short', -5) }

  it { should have_valid(:weight).when(12.5) }
  it { should_not have_valid(:weight).when(nil, 'heavy', -10) }

  it { should have_valid(:gender_rate).when(4) }
  it { should_not have_valid(:gender_rate).when(nil, 'four', -2, 24.8, 9) }

  it { should have_valid(:catch_rate).when(60) }
  it { should_not have_valid(:catch_rate).when(nil, 'sixty', 0, 256) }

  it { should have_valid(:exp_yield).when(173) }
  it { should_not have_valid(:exp_yield).when(nil, 'one seventy three', 333.3) }

  it { should have_valid(:base_happiness).when(70) }
  it { should_not have_valid(:base_happiness).when(nil, 'seventy', -1, 256, 6.1) }

  it { should have_valid(:egg_group1).when(11) }
  it { should_not have_valid(:egg_group1).when(nil, 'eleven', -4, 3.14, 17) }

  it { should have_valid(:egg_group2).when(2) }
  it { should_not have_valid(:egg_group2).when('thirty', -6, 6.5, 17) }

  it { should have_valid(:hatch_counter).when(20) }
  it { should_not have_valid(:hatch_counter).when(nil, 'twenty', -5, 2.4, 1000) }

  it { should have_valid(:lvl_100_exp).when(1_000_000) }
  it { should_not have_valid(:lvl_100_exp).when(nil, 'one million', 21.78, -10) }
end

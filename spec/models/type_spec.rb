require 'rails_helper'

RSpec.describe Type, type: :model do
  it { should have_valid(:name).when('Ghost') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:color).when('#8e77b0') }
  it { should_not have_valid(:name).when(nil, '') }
end

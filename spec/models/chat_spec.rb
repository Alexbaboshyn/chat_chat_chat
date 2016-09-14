require 'rails_helper'

RSpec.describe Chat, type: :model do

  it { should validate_presence_of :name }

  it { should have_many(:messages).dependent(:destroy) }

  it { should have_and_belong_to_many(:users) }
end

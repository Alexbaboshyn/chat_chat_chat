require 'rails_helper'

RSpec.describe UserDecorator do
  let(:user) { stub_model User, id: 1, first_name: 'Bob', last_name: 'Marley', email: 'bob@marley.com' }

  subject { user.decorate }

  describe '#as_json' do

  #  before { expect(subject).to receive(:unreaded_chats_count).and_return 1 }

    its('as_json.symbolize_keys') do
      should eq \
        id: 1,
        full_name: 'Bob Marley',
        email: 'bob@marley.com'
        # unreaded_chats_count: 1
    end
  end
end

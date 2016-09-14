require 'rails_helper'

RSpec.describe MessageDecorator do

  let(:message) { stub_model Message, id: 1, text: 'Text', author: user }

  let(:user) { stub_model User }

  subject { message.decorate  }

  describe '#as_json' do

    before { expect(subject).to receive(:message_status).and_return 1 }

    its('as_json.symbolize_keys') do
      should eq \
        text: 'Text',
        author: user.decorate,
        status: 1
    end
  end


  # describe '#message_status' do
  # # message_users.find_by(user: h.current_user).status
  #   before do
  #     expect(subject).to receive(:message_users) do
  #       double.tap do |a|
  #         expect(a).to receive(:find_by).with(user: user) do
  #           double.tap { |b| expect(b).to receive(:status) }
  #         end
  #       end
  #     end
  #   end
  #   it { expect{ subject.send(:message_status) }.to_not raise_error }
  # end

end

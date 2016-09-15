require 'rails_helper'

RSpec.describe NewChatJob, type: :job do

  let(:user1) { stub_model User }

  let(:user2) { stub_model User }

  let(:resource) { stub_model Chat }



  describe '#perform' do

    before { expect(resource).to receive(:users).and_return([user1, user2]) }

    before do
      expect(ChatMailer).to receive(:new_chat).with(user1, resource) do
        double.tap { |a| expect(a).to receive(:deliver_now) }
      end
    end

    before do
      expect(ChatMailer).to receive(:new_chat).with(user2, resource) do
        double.tap { |a| expect(a).to receive(:deliver_now) }
      end
    end

    it { expect { subject.perform(resource) }.to_not raise_error }
  end

end

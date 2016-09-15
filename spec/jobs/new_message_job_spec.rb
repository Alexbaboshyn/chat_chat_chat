require 'rails_helper'

RSpec.describe NewMessageJob, type: :job do

  let(:user) { double }

  let(:message) { double }

  describe '#perform' do

    before do
      expect(ChatMailer).to receive(:new_message).with(user, message) do
        double.tap { |a| expect(a).to receive(:deliver_now) }
      end
    end
    it { expect { subject.perform(user, message) }.to_not raise_error }
  end

end

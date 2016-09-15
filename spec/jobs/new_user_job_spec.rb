require 'rails_helper'

RSpec.describe NewUserJob, type: :job do

  let(:user) { stub_model User }

  describe '#perform' do

    before do
      expect(ChatMailer).to receive(:invitate_user).with(user) do
        double.tap { |a| expect(a).to receive(:deliver_now) }
      end
    end
    it { expect { subject.perform(user) }.to_not raise_error }
  end

end

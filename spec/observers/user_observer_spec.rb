require 'rails_helper'

RSpec.describe UserObserver, type: :observer do

  let(:user) { stub_model User}

  subject { described_class.send(:new) }


  describe '#after_create' do

    before do
      expect(NewUserJob).to receive(:set).with(wait: 5.seconds) do
        double.tap { |a| expect(a).to receive(:perform_later).with(user) }
      end
    end

    it { expect { subject.after_create(user) }.to_not raise_error }
  end
end

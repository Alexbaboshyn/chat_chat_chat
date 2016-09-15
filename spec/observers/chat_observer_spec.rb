require 'rails_helper'

RSpec.describe ChatObserver, type: :observer do

  let(:chat) { stub_model Chat}

  subject { described_class.send(:new) }


  describe '#after_create' do

    before do
      expect(NewChatJob).to receive(:set).with(wait: 5.seconds) do
        double.tap { |a| expect(a).to receive(:perform_later).with(chat) }
      end
    end

    it { expect { subject.after_create(chat) }.to_not raise_error }
  end
end

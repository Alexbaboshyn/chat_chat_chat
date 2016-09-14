require 'rails_helper'

RSpec.describe MessageObserver, type: :observer do
  let(:user1) { stub_model User }

  let(:user2) { stub_model User }

  let(:message) { stub_model Message }

  subject { described_class.send(:new) }

  describe '#before_save' do

    before do
      expect(message).to receive(:chat) do
        double.tap do |a|
          expect(a).to receive(:users) do
            double.tap { |b| expect(b).to receive(:each).and_return(user1) }
          end
        end
      end
    end

    before do
      expect(message).to receive(:users_messages) do
        double.tap do |a|
          expect(a).to receive(:build).with(user: user)
        end
      end
    end

    it { expect { subject.before_save(message) }.to_not raise_error }
  end
end

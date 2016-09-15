require 'rails_helper'

RSpec.describe MessageObserver, type: :observer do
  let(:user1) { stub_model User }

  let(:user2) { stub_model User }

  let(:chat) { stub_model Chat}

  let(:message) { stub_model Message, text: 'text', author: user1, chat: chat}

  let(:users_message) { stub_model UsersMessage }

  subject { described_class.send(:new) }


  describe '#after_create' do

    before do
      expect(message).to receive(:chat) do
        double.tap do |a|
          expect(a).to receive(:users).and_return([user1, user2])
        end
      end
    end

    before do
      expect(message).to receive(:message_users) do
        double.tap do |a|
          expect(a).to receive(:create!).with(user: user1, status: 1)
        end
      end
    end

    before do
      expect(message).to receive(:message_users) do
        double.tap do |a|
          expect(a).to receive(:create!).with(user: user2)
        end
      end
    end

    before do
      expect(NewMessageJob).to receive(:set).with(wait: 5.seconds) do
        double.tap { |a| expect(a).to receive(:perform_later).with(user2, message) }
      end
    end

    it { expect { subject.after_create(message) }.to_not raise_error }
  end
end

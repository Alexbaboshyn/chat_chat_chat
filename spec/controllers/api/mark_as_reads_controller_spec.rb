require 'rails_helper'

RSpec.describe Api::MarkAsReadsController, type: :controller do

  describe '#show' do

    let(:user) { stub_model User }

    before { sign_in user }

    let(:params) { { chat_id: '1' } }

    let(:object) { stub_model Message}

    before do
      expect(Chat).to receive(:find).with('1') do
        double.tap { |a| expect(a).to receive(:messages).and_return(object) }
      end
    end

    before do
      expect(MessageUser).to receive(:unread) do
        double.tap do |a|
          expect(a).to receive(:where).with(user: user, message: object) do
            double.tap { |b| expect(b).to receive(:update_all).with(status: :read) }
          end
        end
      end
    end

    before { get :show, params: params, format: :json }

    it { expect(response).to have_http_status(:ok) }
  end
end

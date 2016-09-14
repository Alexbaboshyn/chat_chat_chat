require 'rails_helper'

RSpec.describe Api::ChatsController, type: :controller do

  it { should route(:get, 'api/chats').to(action: :index) }

  it { should route(:post, 'api/chats').to(action: :create) }

  it { should route(:get, 'api/chats/1').to(action: :show, id: 1) }

  it { should route(:get, 'api/chats').to(action: :index) }

  # it { should route(:patch, 'api/chats/1').to(action: :update, id: 1) }
  #
  # it { should route(:put, 'api/chats/1').to(action: :update, id: 1) }
  #
  # it { should route(:delete, 'api/chats/1').to(action: :destroy, id: 1) }


  describe '#create.json' do

    let(:user) { stub_model User }

    before { sign_in user }

    let(:object) { stub_model Chat }

    let(:params) { { chat: { name: 'name', user_ids: ['1', '2', '3'] } } }

    before { expect(Chat).to receive(:new)
                         .with(permit!(name: 'name', user_ids: ['1', '2', '3']))
                         .and_return(object) }

    before { expect(object).to receive(:save!) }

    before { post :create, params: params, format: :json }

    it { expect(response).to have_http_status(:ok) }
  end


  describe '#collection' do

    let(:params) { { page: 5 } }

    before { expect(subject).to receive(:params).and_return(params) }

    before do
      expect(Chat).to receive(:page).with(5) do
        double.tap { |a| expect(a).to receive(:per).with(5) }
      end
    end
    it { expect { subject.send :collection }.to_not raise_error }
  end

end

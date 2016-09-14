require 'rails_helper'

RSpec.describe Api::ProfilesController, type: :controller do

  it { should route(:get, 'api/profile').to(action: :show) }

  it { should route(:put, 'api/profile').to(action: :update) }

  it { should route(:patch, 'api/profile').to(action: :update) }

  describe '#update.json' do

    let(:user) { stub_model User }

    before { sign_in user }

    let(:params) { { user: { first_name: 'bob', last_name: 'marley',
                             email: 'bob@marley.com', password: 'bob' } } }

    before { expect(user).to receive(:update!).with(permit!(first_name: 'bob', last_name: 'marley',
                                       email: 'bob@marley.com', password: 'bob')) }



    before { patch :update, params: params, format: :json }

    it { expect(response).to have_http_status(:ok) }

  end
end

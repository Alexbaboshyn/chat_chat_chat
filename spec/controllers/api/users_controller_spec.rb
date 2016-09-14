require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  it { should route(:get, 'api/users').to(action: :index) }

  it { should route(:post, 'api/users').to(action: :create) }

  it { should route(:get, 'api/users/1').to(action: :show, id: 1 ) }

  describe '#create.json' do

    let(:params) { { user: { first_name: 'bob', last_name: 'marley',
                             email: 'bob@marley.com', password: 'bob' } } }

    let(:object) { stub_model User }

    before { expect(User).to receive(:new)
                         .with(permit!(first_name: 'bob', last_name: 'marley',
                                       email: 'bob@marley.com', password: 'bob'))
                         .and_return(object) }

    before { expect(object).to receive(:save!) }

    before { post :create, params: params, format: :json }

    it { expect(response).to have_http_status(:created) }

  end


  describe '#collection' do
    let(:params) { { page: 5 } }

    before { expect(subject).to receive(:params).and_return(params) }

    before do
      expect(User).to receive(:page).with(5) do
        double.tap { |a| expect(a).to receive(:per).with(5) }
      end
    end

    it { expect { subject.send :collection }.to_not raise_error }
  end
end

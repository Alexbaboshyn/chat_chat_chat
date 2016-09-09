require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  
  it { should route(:get, 'api/users').to(action: :index) }

  it { should route(:post, 'api/users').to(action: :create) }

  it { should route(:get, 'api/users/1').to(action: :show, id: 1) }



  describe '#create.json' do
    before { expect(subject).to receive(:build_resource) }

    before do
      expect(subject).to receive(:resource) do
        double.tap { |a| expect(a).to receive(:save!) }
      end
    end

    before { post :create, user: { email: 'one@digits.com', password: '12345678', first_name: 'Name', last_name: 'Surname' }, format: :json }

    it { expect(response).to have_http_status(:created) }
  end

  describe '#build_resource' do
    # @user = User.new resource_params
    let(:params) { { foo: :bar } }

    before { expect(subject).to receive(:resource_params).and_return params }

    before { expect(User).to receive(:new).with(params) }

    it { expect { subject.send(:build_resource) }.to_not raise_error }
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

  describe '#resource' do

    context 'find_params' do
      before { allow(subject).to receive(:params).and_return({id: 1}) }

      before { expect(User).to receive(:find).with(1) }

      it { expect { subject.send :resource }.to_not raise_error }
    end

    context 'current_user' do

      let(:user) { stub_model User }

      before { sign_in user }

      before { expect(subject).to receive(:params).and_return( {} ) }

      it { expect { subject.send :resource }.to_not raise_error }

    end
  end

end

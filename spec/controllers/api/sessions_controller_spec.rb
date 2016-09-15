require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do

  it { should route(:post, 'api/session').to(action: :create)  }

  it { should route(:delete, 'api/session').to(action: :destroy) }

  describe '#create.json' do

    let(:params) {  { email: 'bob@marley.com', password: 'bob' }  }

    let(:object) { stub_model User }

    before { expect(Session).to receive(:new)
                         .with(permit!(params))
                         .and_return(object) }

    before { expect(object).to receive(:save!) }

    before { process :create, method: :post, params: {session: params}, format: :json }

    it { should render_template :create }

  end

  describe '#destroy.json' do
    let(:user) { stub_model User }

    before { sign_in user }

    before do
      expect(subject).to receive(:resource) do
        double.tap { |a| expect(a).to receive(:destroy!) }
      end
    end

    before { delete :destroy, format: :json }

    it { expect(response.status).to eq(200) }
  end

  describe '#build_resource' do
    # @session = Session.new resource_params
    let(:params) { { foo: :bar } }

    before { expect(subject).to receive(:resource_params).and_return params }

    before { expect(Session).to receive(:new).with(params) }

    it { expect { subject.send(:build_resource) }.to_not raise_error }
  end

  describe '#resource' do
    # @session ||= Session.new user: current_user
    let(:user) { stub_model User }

    before { expect(subject).to receive(:current_user).and_return user }

    before { expect(Session).to receive(:new).with(user: user) }

    it { expect { subject.send(:resource) }.to_not raise_error }
  end

  # describe '#resource_params' do

  end

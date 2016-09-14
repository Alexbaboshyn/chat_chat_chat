require 'rails_helper'

RSpec.describe Api::MessagesController, type: :controller do

 describe '#create.json' do
   let(:params) { { chat_id: '1', message: { text: 'text' } } }

   let(:parent) { stub_model Chat }

   let(:object) { stub_model Message}

   let(:user) { stub_model User}

   before { sign_in user }

   before { expect(Chat).to receive(:find).with('1').and_return(parent) }

   before do
     expect(parent).to receive(:messages) do
       double.tap { |a| expect(a).to receive(:build).with(permit!(text: 'text', author: user)).and_return(object) }
     end
   end

   before { expect(object).to receive(:save!) }

   before { post :create, params: params, format: :json }

   it { expect(response).to have_http_status(:ok) }
 end

 describe '#collection' do
   let(:params) { { page: 5 } }

   before { expect(subject).to receive(:params).and_return(params) }

   before do
     expect(Message).to receive(:page).with(5) do
       double.tap { |a| expect(a).to receive(:per).with(5) }
     end
   end

   it { expect { subject.send :collection }.to_not raise_error }
 end


end

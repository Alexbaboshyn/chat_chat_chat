require "rails_helper"

RSpec.describe ChatMailer, type: :mailer do
  include EmailSpec::Matchers
  include EmailSpec::Helpers

  describe "#invitate_user" do

    let(:user) { stub_model User, email: 'bob@marley.com', first_name: 'Bob', last_name: 'Marley' }
    let(:email) { ChatMailer.invitate_user(user) }

    it "sets to be delivered to provided email" do
      expect(email).to deliver_to('bob@marley.com')
    end

    it "has welcome message in the body" do
      expect(email).to have_body_text("Welcome, Bob Marley enjoy your stay ")
    end

    it "has subject" do
      expect(email).to have_subject('Welcome!')
    end
  end



  # describe "#new_message" do
  #
  #   let(:user) { stub_model User, email: 'bob@marley.com', first_name: 'Bob', last_name: 'Marley' }
  #   let(:message) { stub_model Message }
  #   let(:email) { ChatMailer.new_message(user, message) }
  #
  #   it "sets to be delivered to provided email" do
  #     expect(email).to deliver_to('bob@marley.com')
  #   end
  #
  #   it "has subject" do
  #     expect(email).to have_subject('New message!')
  #   end
  # end


end

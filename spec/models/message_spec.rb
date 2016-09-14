require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should validate_presence_of :text }

  it { should belong_to(:author) }

  it { should belong_to(:chat) }

  it { should have_many(:message_users) }

  it { should have_many(:users).through(:message_users) }
end

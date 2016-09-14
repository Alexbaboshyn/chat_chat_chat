require 'rails_helper'

RSpec.describe MessageUser, type: :model do
  it { should belong_to(:user) }

  it { should belong_to(:message) }

  it do
    should define_enum_for(:status).with([:unread, :read])
  end

end

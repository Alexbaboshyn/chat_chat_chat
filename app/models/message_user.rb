class MessageUser < ApplicationRecord

    enum status: [:unread, :read]

    belongs_to :user

    belongs_to :message
      
end

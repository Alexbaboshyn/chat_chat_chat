class MessageUser < ApplicationRecord

    enum status: [:unread, :read]

    belongs_to :user

    belongs_to :message

    # scope :unread, -> { where(status: 0) }
end

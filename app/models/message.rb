class Message < ApplicationRecord
  validates :text, presence: true

  # attr_accessor :user

  belongs_to :author, class_name: 'User'

  belongs_to :chat

  has_many :message_users

  has_many :users, through: :message_users

  scope :unread, -> {joins(:message_users).where(message_users:{ status: 0 }) }

end

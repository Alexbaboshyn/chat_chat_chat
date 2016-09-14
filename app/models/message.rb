class Message < ApplicationRecord

  validates :text, presence: true

  belongs_to :author, class_name: 'User'

  belongs_to :chat

  has_many :message_users, dependent: :destroy

  has_many :users, through: :message_users

  scope :unread, -> {joins(:message_users).where(message_users:{ status: 0 }) }

  scope :read, -> {joins(:message_users).where(message_users:{ status: 1 }) }



end

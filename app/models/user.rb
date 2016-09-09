class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true

  validates_uniqueness_of :token, :allow_blank => true, :allow_nil => true

  has_and_belongs_to_many :chats

  has_many :message_users

  has_many :messages, through: :message_users
end

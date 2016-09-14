class NewMessageJob < ActiveJob::Base
  queue_as :default

  def perform(user, message)
    ChatMailer.new_message(user, message).deliver_now
  end
end

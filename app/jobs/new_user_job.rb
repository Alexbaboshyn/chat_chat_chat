class NewUserJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    ChatMailer.invitate_user(user).deliver_now
  end
end

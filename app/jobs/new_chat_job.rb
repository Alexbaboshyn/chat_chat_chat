class NewChatJob < ActiveJob::Base
  queue_as :default

  def perform(resource)
    resource.users.each do |user|
      ChatMailer.new_chat(user, resource).deliver_now
    end
  end
end

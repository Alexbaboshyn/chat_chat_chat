class MessageObserver < ActiveRecord::Observer

  def after_create(message)
    return unless message.class.name == 'Message'

    message.chat.users.each do |user|

      if user == message.author
        message.message_users.create!(user: user, status: 1)
      else
        message.message_users.create!(user: user)
        NewMessageJob.perform_now(user, message)
      end
    end
  end

end

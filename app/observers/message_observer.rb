class MessageObserver < ActiveRecord::Observer

  def after_create(message)
    return unless message.class.name == 'Message'

    message.chat.users.each do |user|

      if user == message.author
        message.message_users.create!(user: user, status: 1)
      else
        message.message_users.create!(user: user)
        NewMessageJob.set(wait: 5.seconds).perform_later(user, message)
      end
    end
  end

end

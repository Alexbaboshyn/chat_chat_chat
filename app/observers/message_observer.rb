class MessageObserver < ActiveRecord::Observer

  def after_create(message)
    return unless message.class.name == 'Message'

    message.chat.users.each do |i|

      if i.id != message.author_id
        message.message_users.create!(user: i)
      else
        message.message_users.create!(user: i, status: 1)
      end
    end
  end

end

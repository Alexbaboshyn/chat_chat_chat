class ChatDecorator < Draper::Decorator
delegate_all

decorates_association :users
decorates_association :messages


  def as_json *args

    if context[:index]

      {
        id: id,
        name: name,
        users: users,
        unread_messages_count: unread_messages_count,
        last_message: last_message
      }

    elsif context[:show]

      {
        id: id,
        name: name,
        users: users,
        unread_messages_count: unread_messages_count,
        messages: messages
      }

    else

      {
        id: id,
        name: name,
        users: users,
        unread_messages_count: unread_messages_count
      }

    end

  end


  def unread_messages_count
    counter = []
    messages.each do |t|
      if t.message_users.find_by(user: h.current_user).unread?
        counter << t
      end
    end
    counter.size
  end


  def last_message
    messages.last
  end


end

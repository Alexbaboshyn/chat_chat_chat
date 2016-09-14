class MessageDecorator < Draper::Decorator
  delegate_all

  decorates_association :author

  def as_json *args

    {
      text: text,
      author: author,
      status: message_status
    }
  end

  def message_status
    message_users.find_by(user: h.current_user).status
  end

end

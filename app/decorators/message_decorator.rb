class MessageDecorator < Draper::Decorator
  delegate_all

  decorates_association :author

  def as_json *args
  
    {
      text: text,
      author: author,
      status: status
    }
  end

  def status
    message_users.find_by(user: current_user).status
  end

  def current_user
    h.current_user
  end

end

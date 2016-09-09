class UserDecorator < Draper::Decorator
  delegate_all
  def as_json *args
    # byebug
    {
      id: id,
      full_name: full_name,
      email: email,
      unreaded_chats_count: unread_chats_count
    }
  end

  def full_name
    "#{ first_name } #{ last_name }"
  end

  def unread_chats_count

  end



end

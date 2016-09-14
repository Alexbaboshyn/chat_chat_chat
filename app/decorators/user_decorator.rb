class UserDecorator < Draper::Decorator
  delegate_all
  def as_json *args

    {
      id: id,
      full_name: full_name,
      email: email,
      # unreaded_chats_count: unread_chats_count
    }
  end

  def full_name
    "#{ first_name } #{ last_name }"
  end

  # def unread_chats_count
  #   byebug
  #   # messages.unread.chat.count
  #
  #   # chats.joins(:messages).where(message: model.message_users.message_ids).count
  #
  #   messages.
  # end



end

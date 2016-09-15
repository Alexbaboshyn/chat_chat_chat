class ChatObserver < ActiveRecord::Observer

  def after_create(chat)
    NewChatJob.set(wait: 5.seconds).perform_later(chat)
  end

end

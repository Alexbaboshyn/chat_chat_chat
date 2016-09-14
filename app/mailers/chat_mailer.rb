class ChatMailer < ApplicationMailer

  def new_message(user, message)
    @user = user

    @chat = message.chat

    mail(to: @user.email , subject: "New message!")
  end


  def invitate_user(user)
    @user = user
    mail(to: @user.email , subject: "Wellcome!")
  end


  def new_chat(user, resource)
    @user = user
    @chat = resource
    mail(to: @user.email , subject: "New chat")
  end


end

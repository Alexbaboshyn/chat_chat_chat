class Api::MarkAsReadsController < ApplicationController


  def show
    MessageUser.unread
              .where(user: current_user, message: Chat.find(params[:chat_id]).messages)
              .update_all(status: :read)
    head :ok
  end


end

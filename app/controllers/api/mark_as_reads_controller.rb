class Api::MarkAsReadsController < ApplicationController

  
  def show
    Chat.find(params[:chat_id]).users.each do |t|
      t.message_users.update_all(status: 1)
    end
    head :ok
  end


end

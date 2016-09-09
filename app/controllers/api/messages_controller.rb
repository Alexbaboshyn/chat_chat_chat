class Api::MessagesController < ApplicationController


  # def create
  #   super
  #   head :created
  # end


  private
  def parent
    @parent ||= Chat.find(params[:chat_id])
  end

  def build_resource
    @resource = parent.messages.build(resource_params.merge(author: current_user))
  end

  def resource
    @resource ||= Message.find params[:id]
  end

  def collection
    @collection = Message.page(params[:page]).per(5)
  end

  def resource_params
    params.require(:message).permit(:text)
  end
end

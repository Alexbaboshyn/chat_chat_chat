class Api::ChatsController < ApplicationController
skip_before_action :authenticate

  def create
    super
    NewChatJob.perform_now(resource)
  end

  private
  def build_resource
    @resource = Chat.new resource_params
  end

  def resource
    @resource ||= Chat.find params[:id]
  end

  def collection
    @collection = Chat.page(params[:page]).per(5)
  end

  def resource_params
    params.require(:chat).permit(:name, user_ids: [])
  end
end

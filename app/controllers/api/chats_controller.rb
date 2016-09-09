class Api::ChatsController < ApplicationController

  # skip_before_action :authenticate

  # def mark_as_read
  #   Chat.find(params[:id]).users.each do |t|
  #     t.message_users.update_all(status: 1)
  #   end
  #   head :ok
  # end


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

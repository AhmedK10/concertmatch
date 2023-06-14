class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new
    user = User.find(params[:user_id])
    @chatroom.user = user
    @chatroom.name = "#{current_user.first_name} & #{user.first_name}"
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end
end

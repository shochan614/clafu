class MessagesController < ApplicationController
  def index
    @message = Message.new
    @class_room = ClassRoom.find(params[:class_room_id])
    @messages = @class_room.messages.includes(:user)
  end

  def create
    @class_room = ClassRoom.find(params[:class_room_id])
    @message = Message.new(massage_params)
    if @message.save
      redirect_to class_room_messages_path(current_user.class_room.id)
    else
    @messages = @class_room.messages.includes(:user)
      render :index
    end
  end

private
  def massage_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, class_room_id: params[:class_room_id])
  end
end

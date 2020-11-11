class MessagesController < ApplicationController
  # before_action :reject  # 自分とは違うclass_roomのチャットルームには入らせない
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

  def destroy
    @message = Message.find(params[:id])
    if @message.user.id == current_user.id
      @message.destroy
      redirect_to class_room_messages_path(current_user.class_room.id)
    else
      render :index
    end

  end

private
  def massage_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id, class_room_id: params[:class_room_id])
  end
  # def reject
  #   @class_room = ClassRoom.find(params[:class_room_id])
  #   redirect_to root_path if user_signed_in? && current_user.class_room_id == @class_room.id
  # end
end

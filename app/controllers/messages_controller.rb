class MessagesController < ApplicationController
  before_action :reject  # 自分とは違うclass_roomのチャットルームには入らせない
  before_action :authenticate_user!	
  before_action :set_class_room_id, only: [:index, :create, ]
  def index
    @message = Message.new
    @messages = @class_room.messages.includes(:user)
  end

  def create
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
  def reject
    @class_room = ClassRoom.find(params[:class_room_id])
    redirect_to root_path unless user_signed_in? && current_user.class_room.id == @class_room.id
  end
  def set_class_room_id
    @class_room = ClassRoom.find(params[:class_room_id])
  end
end

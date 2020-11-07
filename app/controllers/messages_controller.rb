class MessagesController < ApplicationController
  def index
    @message = Message.new
    @class_room = ClassRoom.find(params[:class_room_id])

  end
end

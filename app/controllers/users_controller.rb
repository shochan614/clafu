class UsersController < ApplicationController
  before_action :reject  # 自分とは違うclass_roomのチャットルームには入らせない
  before_action :authenticate_user!
  before_action :set_user_id, only: [:show, :edit]

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_user_id
    @user = User.select(:id, :nickname, :first_name, :last_name, :email).find(params[:id])
  end
  def reject
    @class_room = ClassRoom.find(params[:class_room_id])
    redirect_to root_path unless user_signed_in? && current_user.class_room.id == @class_room.id
    # @user = User.find(params[:id])
    # redirect_to root_path if current_user.id != @user.id
  end
end

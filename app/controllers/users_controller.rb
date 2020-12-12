class UsersController < ApplicationController
  before_action :set_user_id, only: [:show, :edit]

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_user_id
    @user = User.find(params[:id])
  end
end

class ClassRoomsController < ApplicationController
  def index
  end
  
  def new
    @schools = School.select(:name, :id).order("created_at DESC") #学校登録が新しい順に表示させる
    @class_room = ClassRoom.new
  end

  def create
    @class_room = ClassRoom.new(class_room_params)
    if @class_room.save
      render :show
    else
      @schools = School.select(:name, :id).order("created_at DESC") #学校登録が新しい順に表示させる
      render :new
    end
  end

  def show
    @class_room = ClassRoom.find(params[:id])
  end

  private
    def class_room_params
      params.require(:class_room).permit(:school_id, :grade, :class_number, :class_goals) 
    end
end

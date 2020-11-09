class ClassRoomsController < ApplicationController
  def index
  end
  
  def new
    @schools = School.all
    @class_room = ClassRoom.new
  end

  def create
    @class_room = ClassRoom.new(class_room_params)
    if @class_room.save
      redirect_to root_path
    else
      @schools = School.all
      render :new
    end
  end

  private
    def class_room_params
      params.require(:class_room).permit(:school_id, :grade, :class_number, :class_goals) 
    end
end

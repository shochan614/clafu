class SchoolsController < ApplicationController
  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def school_params
      params.require(:school).permit(:name) 
    end
end

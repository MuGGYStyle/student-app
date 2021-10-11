class CoursesController < ApplicationController
  def index
    @courses = Course::all
  end

  def new
    @course = Course.new
  end
  

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = 'Course was successfully created.'
      redirect_to courses_path
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice] = 'Course updated!'
      redirect_to courses_path
    else
      flash[:error] = 'Failed to edit course!'
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.delete
      flash[:notice] = 'Course deleted!'
      redirect_to courses_path
    else
      flash[:error] = 'Failed to delete this course!'
      render :destroy
    end
  end

  private

  def course_params
    params.require(:course).permit(
      :name,
      :credit
    )
  end
  
end

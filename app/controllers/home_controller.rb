class HomeController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student_courses = StudentCourse.where(student_id: params[:id])
  end

  def new
    @student_course = StudentCourse.new
  end

  def create
    @student_course = StudentCourse.new(student_course_params)
    if @student_course.save
      flash[:notice] = 'Student course was successfully created.'
      redirect_to home_path(@student_course.student_id)
    else
      render :new
    end
  end

  def edit
    @student_course = StudentCourse.find(params[:id])
  end

  def update
    @student_course = StudentCourse.find(params[:id])
    if @student_course.update(student_course_params)
      flash[:notice] = 'Student course updated!'
      redirect_to home_path(@student_course.student_id)
    else
      flash[:error] = 'Failed to edit student course!'
      render :edit
    end
  end

  def destroy
    @student_course = StudentCourse.find(params[:id])
    if @student_course.delete
      flash[:notice] = 'Student course deleted!'
      redirect_to home_path(@student_course.student_id)
    else
      flash[:error] = 'Failed to delete this student course!'
      render :destroy
    end
  end

  private
  
  def student_course_params
    params.require(:student_course).permit(:student_id, :course_id, :grade_point)
  end

end

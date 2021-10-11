class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = 'Student was successfully created.'
      redirect_to students_path
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = 'Student updated!'
      redirect_to students_path
    else
      flash[:error] = 'Failed to edit student!'
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.delete
      flash[:notice] = 'Student deleted!'
      redirect_to students_path
    else
      flash[:error] = 'Failed to delete this student!'
      render :destroy
    end
  end

  private
  
  def student_params
    params.require(:student).permit(:last_name, :first_name, :age)
  end

end

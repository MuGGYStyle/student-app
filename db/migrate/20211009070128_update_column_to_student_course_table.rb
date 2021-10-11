class UpdateColumnToStudentCourseTable < ActiveRecord::Migration[6.1]
  def change
    change_column :student_courses, :grade_point, :decimal, default: 0
  end
end

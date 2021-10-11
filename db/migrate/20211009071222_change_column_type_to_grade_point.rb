class ChangeColumnTypeToGradePoint < ActiveRecord::Migration[6.1]
  def change
    change_column :student_courses, :grade_point, :decimal, precision: 10, scale: 2
  end
end

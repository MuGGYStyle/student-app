class StudentCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :student_courses do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :grade_point, :default => 0, :null => false
      t.timestamps
    end
  end
end

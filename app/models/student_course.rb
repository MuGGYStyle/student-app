class StudentCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :student_id, presence: true
  validates :course_id, presence: true
  validates :grade_point, presence: true
  validates_inclusion_of :grade_point, :in => 0.0..4.0

end

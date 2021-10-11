class Student < ApplicationRecord
  has_many :student_courses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }

  def gpa
    student_courses.average(:grade_point).to_f.round(2)
  end

  def total_credit
    student_courses.joins(:course).sum(:credit)
  end

end

class Course < ApplicationRecord
  has_many :student_courses

  validates :name, presence: true, uniqueness: true
  validates :credit, presence: true, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
end

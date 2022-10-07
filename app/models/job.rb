class Job < ApplicationRecord
  # ASOCIACIONES
  belongs_to :user, counter_cache: true

  has_many :applications, dependent: :destroy
  belongs_to :category

  # VALIDACIONES
  # validates :about_job, :mandatory_requirements, :optional_requirements, presence: true
  # validates :min_salary, :max_salary, numericality: { only_integer: true }
  # validates :job_title, presence: true, format: { with: /[a-zA-Z]/ }
  # validates :optional_requirements, length: { in: 100..250 }
  # validates :about_job, length: { in: 150..400 }
  # validates :min_salary, comparison: { less_than: :max_salary }
  # validates :max_salary, comparison: { greater_than: :min_salary }
  # validates :mandatory_requirements, length: { minimum: 200 }

  enum types: { full_time: 0, part_time: 1 }
end

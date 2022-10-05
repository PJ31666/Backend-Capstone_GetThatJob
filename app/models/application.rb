class Application < ApplicationRecord
  # ASOCIACIONES
  belongs_to :user
  belongs_to :job
  has_one_attached :new_cv

  # VALIDACIONES
  validates :new_cv, :professional_experience, :professional_interesed, presence: true
  validates :professional_interesed, length: { in: 50..1000 }
  validates :new_cv, size: { less_than: 5.5.megabytes }

  enum status: [:waiting, :progress, :finished, :declined]
end

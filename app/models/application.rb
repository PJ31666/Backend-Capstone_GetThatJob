class Application < ApplicationRecord
  # ASOCIACIONES
  belongs_to :user
  belongs_to :job
  # has_one_attached :new_cv

  # VALIDACIONES
  validates :new_cv, :professional_experience, :professional_interesed, presence: true
  validates :professional_interesed, length: { in: 50..1000 }
  validate :validate_file

  enum status: [:waiting, :progress, :finished, :declined]


  private

  def valid_cvfile_size
    errors[:new_cv] << "should be 5MB Max." if new_cv.size > 5.5.megabytes
  end

  def validate_file
    return valid_cvfile_size if new_cv.nil?
  end
end

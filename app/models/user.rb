require "uri"
class User < ApplicationRecord
  has_secure_token
  has_secure_password

  # ASOCIACIONES
  has_one_attached :cv_file
  has_one_attached :logo_company
  has_many :applications, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :jobs, dependent: :destroy

  # # VALIDACIONES
  validates :company_name, presence: true if :recruiter?
  enum roles: { professional: 0, recruiter: 1 }
  validates :company_name, length: { in: 6..30 }, uniqueness: true
  validates :email, :password_digest, :roles, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/ }
  validates :password_digest, length: { minimum: 6 }
  validates :name, :job_title, format: { with: /[a-zA-Z]/ }, allow_blank: true
  validates :phone, numericality: true, allow_blank: true
  validates :birthdate,
            comparison: { less_than: Time.zone.today, message: "can't be in the future" }, allow_blank: true
  validates :birthdate,
            comparison: { greater_than: 120.years.ago, message: "can't be more than 120 years ago" }, allow_blank: true
  validates :professional_experience, length: { in: 300..2000 }, allow_blank: true
  validates :about_company, length: { in: 100..2000 }, allow_blank: true
  validate :validate_file

  def invalidate_token
    update(token: nil)
  end

  private

  def valid_cvfile_size
    errors[:cv_file] << "should be 5MB Max." if cv_file.size > 5.5.megabytes
  end

  def validate_file
    return valid_cvfile_size if cv_file.nil
  end
end

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

  # VALIDACIONES
  validates :email, :company_name, :password_digest, presence: true
  validates :company_name, length: { in: 6..30 }, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/ }
  validates :password_digest, length: { minimum: 6 }
  validates :name, :job_title, format: { with: /[a-zA-Z]/ }
  validates :phone, numericality: true
  validates :birthdate,
            comparison: { less_than: Time.zone.today, message: "can't be in the future" }
  validates :birthdate,
            comparison: { greater_than: 120.years.ago, message: "can't be more than 120 years ago" }
  validates :professional_experience, length: { in: 300..2000 }, allow_blank: true
  validates :about_company, length: { in: 100..2000 }, allow_blank: true
  validate :validate_file
  # validate :validate_url
  # validate link.valid_url?
  # validate valid_url?(link)
  enum roles: { professional: 0, recruiter: 1 }

  # user[:linked_url] = link

  private

  # def valid_url?(url)
  #   PublicSuffix.valid?("#{url}")
  # end

  # def validate_url
  #   errors[:linked_url] << "Should be a valid link" if linked_url.valid_url?
  # end

  def valid_cvfile_size
    errors[:cv_file] << "should be 5MB Max." if cv_file.size > 5.5.megabytes
  end

  def validate_file
    return valid_cvfile_size if cv_file.nil?
  end

  # , format: { with: PASSWORD_FORMAT }

  # PASSWORD_FORMAT = /\A
  #   (?=.{8,})          # Must contain 8 or more characters
  #   (?=.*\d)           # Must contain a digit
  #   (?=.*[a-z])        # Must contain a lower case character
  #   (?=.*[A-Z])        # Must contain an upper case character
  #   (?=.*[[:^alnum:]]) # Must contain a symbol
end

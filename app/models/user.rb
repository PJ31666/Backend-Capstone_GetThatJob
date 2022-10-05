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
  validates :email, :password, :company_name, presence: true
  validates :company_name, length: { in: 6..30 }, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/ }
  validates :password, length: { minimum: 6 }
  validates :name, :job_title, format: { with: /[a-zA-Z]/ }
  validates :phone, numericality: true
  validates :birthdate,
            comparison: { less_than: Time.zone.today, message: "can't be in the future" }
  validates :birthdate,
            comparison: { greater_than: 120.years.ago, message: "can't be more than 120 years ago" }
  # validates :professional_exp, length: { in: 300..2000 }
  # validates :about_company, length: { in: 100..2000 }
  validate :linked_url
  enum roles: [:professional, :recruiter]

  private

  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def valid_cvfile_size
    errors[:cv_fie] << "should be 5MB Max." if cv_file.size > 5.5.megabytes
  end

  # , format: { with: PASSWORD_FORMAT }

  # PASSWORD_FORMAT = /\A
  #   (?=.{8,})          # Must contain 8 or more characters
  #   (?=.*\d)           # Must contain a digit
  #   (?=.*[a-z])        # Must contain a lower case character
  #   (?=.*[A-Z])        # Must contain an upper case character
  #   (?=.*[[:^alnum:]]) # Must contain a symbol
  # /x
end

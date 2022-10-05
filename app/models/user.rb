class User < ApplicationRecord
  has_secure_token
  has_secure_password

  # ASOCIACIONES
  has_one_attached :cv_file
  has_one_attached :logo_company
  has_many :applications, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :jobs, dependent: :destroy
end

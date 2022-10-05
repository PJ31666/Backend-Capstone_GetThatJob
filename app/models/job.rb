class Job < ApplicationRecord
  # ASOCIACIONES
  belongs_to :user

  has_many :applications, dependent: :destroy
  has_many :category, dependent: :destroy
end

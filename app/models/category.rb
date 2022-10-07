class Category < ApplicationRecord
  # ASOCIACIONES
  has_many :jobs, dependent: :destroy

  # VALIDACIONES
  validates :category, presence: true, uniqueness: true
end

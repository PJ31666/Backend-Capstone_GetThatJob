class Category < ApplicationRecord
  # ASOCIACIONES
  has_many :jobs, dependent: :destroy

  # VALIDACIONES
end

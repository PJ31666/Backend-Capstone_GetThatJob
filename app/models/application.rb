class Application < ApplicationRecord
  # ASOCIACIONES
  belongs_to :user
  belongs_to :job
  has_one_attached :new_cv
end

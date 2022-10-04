class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_one_attached :new_cv
end

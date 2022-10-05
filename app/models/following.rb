class Following < ApplicationRecord
  # ASOCIACIONES
  belongs_to :job
  belongs_to :user
end

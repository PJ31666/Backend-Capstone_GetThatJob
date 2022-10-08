class Following < ApplicationRecord
  # ASOCIACIONES
  belongs_to :job
  belongs_to :user, counter_cache: true
end

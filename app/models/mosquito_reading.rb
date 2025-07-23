class MosquitoReading < ApplicationRecord
  belongs_to :mosquito_trap

  validates :date, :count, presence: true
end

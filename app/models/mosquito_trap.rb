class MosquitoTrap < ApplicationRecord
  has_many :mosquito_readings, dependent: :destroy
  has_and_belongs_to_many :inspectors

  validates :trap_id, :name, :latitude, :longitude, presence: true
end

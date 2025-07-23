class Inspector < ApplicationRecord
  has_and_belongs_to_many :mosquito_traps

  validates :name, :email, presence: true
end

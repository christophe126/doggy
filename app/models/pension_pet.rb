class PensionPet < ApplicationRecord
  belongs_to :pet
  belongs_to :pension
end

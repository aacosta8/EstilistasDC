class Person < ApplicationRecord
  belongs_to :ubication
  validates :cedula, uniqueness: true

end

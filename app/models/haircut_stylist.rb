class HaircutStylist < ApplicationRecord
  belongs_to :stylist
  belongs_to :haircut
end

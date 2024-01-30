class Design < ApplicationRecord
  has_one_attached :image
  belogns_to :user
end

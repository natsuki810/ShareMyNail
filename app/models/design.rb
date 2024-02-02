class Design < ApplicationRecord
  has_one_attached :image
  belogns_to :user
  has_many :favorites
  has_many :comments
  belogns_to :color
end

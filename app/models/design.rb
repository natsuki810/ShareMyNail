class Design < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true
  belongs_to :user
  has_many :favorites
  has_many :comments
  belongs_to :color
end

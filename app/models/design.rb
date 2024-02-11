class Design < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  belongs_to :user
  has_many :favorites
  has_many :comments
  belongs_to :color
end

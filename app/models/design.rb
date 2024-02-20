class Design < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :color
  has_many :reports

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end

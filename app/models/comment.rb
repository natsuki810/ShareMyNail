class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :design
  belongs_to :user
  has_many :replies, dependent: :destroy
  has_many :reports
end

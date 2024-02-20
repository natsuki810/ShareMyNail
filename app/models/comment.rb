class Comment < ApplicationRecord
  belongs_to :design
  belongs_to :user
  has_many :replies, dependent: :destroy
  has_many :reports
end

class Comment < ApplicationRecord
  has_many :designs
  belongs_to :user
end

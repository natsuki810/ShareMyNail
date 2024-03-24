class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :design
  validates :user_id, uniqueness: { scope: :design_id }
end

class Favorite < ApplicationRecord
  before_action :authenticate_user!
  belogns_to :user
  belogns_to :design
end

class Report < ApplicationRecord
  belogns_to :comment
  belogns_to :design
  belogns_to :user
end

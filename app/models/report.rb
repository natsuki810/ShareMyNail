class Report < ApplicationRecord
  belongs_to :comment, optional: true
  belongs_to :design, optional: true
  belongs_to :reply, optional: true
  belongs_to :user
end

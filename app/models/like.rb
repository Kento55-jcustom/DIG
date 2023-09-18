class Like < ApplicationRecord
  belongs_to :ibane
  belongs_to :user
  validates_uniqueness_of :ibane_id, scope: :user_id
end

class Ibane < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :ibane_tag_relations, dependent: :destroy
    has_many :tags, through: :ibane_tag_relations, dependent: :destroy
    has_many :comments, dependent: :destroy

end

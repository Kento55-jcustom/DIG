class Tag < ApplicationRecord
    validates :name, presence: true
    has_many :ibane_tag_relations, dependent: :destroy
    has_many :ibanes, through: :ibane_tag_relations, dependent: :destroy
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :ibanes, dependent: :destroy
         validates :user_name, presence: true
         validates :profile, length: { maximum: 200 }
         has_many :likes, dependent: :destroy
         has_many :comments, dependent: :destroy
        has_many :liked_ibanes, through: :likes, source: :ibane
    def already_liked?(ibane)
      self.likes.exists?(ibane_id: ibane.id)
    end
    
end

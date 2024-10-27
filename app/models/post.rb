class Post < ApplicationRecord
  belongs_to :problem
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  
  validates :content, presence: true, length: { minimum: 5 }
end

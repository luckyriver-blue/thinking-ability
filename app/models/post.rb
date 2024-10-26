class Post < ApplicationRecord
  belongs_to :problem
  belongs_to :user
  has_many :user_posts
  has_many :users, through: :user_posts
  
  validates :content, presence: true, length: { minimum: 5 }
end

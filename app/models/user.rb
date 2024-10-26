class User < ApplicationRecord
  has_many :posts
  has_many :user_posts
  has_many :posts, through: :user_books
end

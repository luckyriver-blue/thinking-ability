class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :user_id, uniqueness: { scope: :post_id} 
  #一人のユーザーが同じ投稿にlikeを押せないようにする
end

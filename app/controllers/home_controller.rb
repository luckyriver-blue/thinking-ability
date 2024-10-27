class HomeController < ApplicationController
  before_action :authenticate_user!
  def top
    #自分の投稿一覧
    @posts = Post.where(user_id: current_user.id)

    @posts = Post.where(user_id: current_user.id)
    @posts_count = @posts.count
    @get_likes_count = Like.where(post_id: @posts.select(:id)).count
    @achievement = @posts_count + @get_likes_count || 0
    
  end
end

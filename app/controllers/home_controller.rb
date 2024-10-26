class HomeController < ApplicationController
  def top
    #自分の投稿一覧
    @current_user = 1 #一時的に
    @posts = Post.where(user_id: @current_user)
  end
end

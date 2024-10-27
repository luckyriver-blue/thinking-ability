class HomeController < ApplicationController
  before_action :authenticate_user!
  def top
    #自分の投稿一覧
    @posts = Post.where(user_id: current_user.id)
  end
end

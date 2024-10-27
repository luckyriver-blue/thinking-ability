class LikesController < ApplicationController
  def create
    @problem = Problem.find(params[:problem_id])
    @post = Post.find(params[:post_id])
    current_user.likes.create(post: @post)
    redirect_back fallback_location: problem_post_path(@problem, @post)
  end

  def destroy
    @problem = Problem.find(params[:problem_id])
    @post = Post.find(params[:post_id])
    current_user.likes.find_by(post_id: @post.id)&.destroy
    redirect_back fallback_location: problem_post_path(@problem, @post)
  end
end

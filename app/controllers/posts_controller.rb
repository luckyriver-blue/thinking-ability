class PostsController < ApplicationController
  #投稿詳細
  def show
    @problem = Problem.find(params[:problem_id])
    @post = Post.find(params[:id])
    @problem_posts = @problem.posts
  end
  
  #新規投稿
  def new
    @post = Post.new
  end
  
  #投稿登録
  def create
    @problem = Problem.find(params[:problem_id])
    @post = @problem.posts.new(post_params)
    if @post.save
      redirect_to problem_post_path(@problem, @post)
    else
      render 'problems/show', status: :unprocessable_entity
    end
  end
  
  def destroy
    @@problem = Problem.find(params[:problem_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
  
  private
  def post_params
    params.require(:post).permit(:content)
  end
end

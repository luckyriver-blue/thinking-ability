class PostsController < ApplicationController
  #投稿詳細
  def show
    @problem = Problem.find(params[:problem_id])
    @post = Post.find(params[:id])
    
    # OpenAI APIを呼び出してレスポンスを取得
    
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "簡単にフィードバックお願いします" },
          { role: "user", content: @post.content }
        ],
        max_tokens: 200,
        temperature: 0.5
      }
    )
    @generated_text = response.dig("choices", 0, "message", "content")
  
  
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
    @post.user = current_user
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

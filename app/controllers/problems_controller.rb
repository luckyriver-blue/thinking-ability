class ProblemsController < ApplicationController
  #問題選択表示
  def index
    @problems = Problem.all
  end

  #問題詳細
  def show
    @problem = Problem.find(params[:id])
  end
end

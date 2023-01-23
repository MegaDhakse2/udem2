class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = User.first.id
    #@article.user = User.first
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to articles_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :author, :body, :user_id)
  end
end

class ArticlesController < ApplicationController
  before_action :user_security, except: %i[show index]
  before_action :same_user_security, only: %i[edit update destroy]
  def index
    @article = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    # @article.user_id = User.first.id
    @article.user_id = session[:user_id]
    #@article.user = User.first
    if @article.save
      flash[:notice] = "Article was created successfully."
      # redirect_to @article
      redirect_to user_path(current_user)
    else
      flash[
        :error
      ] = "Something went wrong please fill respective fields correctly"

      render "new", status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :author, :body, variety_ids: [])
  end

  def same_user_security
    @article = Article.find(params[:id])
    if current_user != @article.user && !current_user.admin?
      redirect_to @article
    end
  end
end

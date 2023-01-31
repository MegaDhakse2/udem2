class UsersController < ApplicationController
  before_action :user_security, only: %i[edit update]
  before_action :same_user_security, only: %i[edit update destroy]

  def index
    @user = User.paginate(page: params[:page], per_page: 5)
    # @articles = current_user.articles
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to udem #{@user.username}"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil if @user == current_user #wrong--> if !current_user.admin?
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def same_user_security
    @user = User.find(params[:id])
    redirect_to @user if current_user != @user && !current_user.admin?
  end
end

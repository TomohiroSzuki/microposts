class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers]
  
  def show
   @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "ユーザー情報を更新しました。"
    else 
      render 'edit'
    end
  end
  
  def followings
    @followings = @user.following_users.order(created_at: :desc)
  end
  
  def followers
    @followers = @user.follower_users.order(created_at: :desc)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :area, :university)
  end
  def set_user
    @user = User.find(params[:id])
  end
end

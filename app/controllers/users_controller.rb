class UsersController < ApplicationController

  def index
      @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    # @user.update(user_params)
  end

  def update
    if @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to root_path
    else
        render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

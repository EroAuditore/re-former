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
      flash[:notice] = 'user was created successfully.'
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

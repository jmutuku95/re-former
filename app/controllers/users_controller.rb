class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render 'new', notice: 'User updated successfully' 
    else
       render :edit, notice: 'User update failed' 
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

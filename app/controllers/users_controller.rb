class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
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
    # binding.pry
    if @user.update(user_params)
      # binding.pry
      flash['notice'] = 'User updated successfully'
      render 'new'
    else
      # binding.pry
      flash['notice'] = 'User update failed'
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

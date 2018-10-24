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
      render 'new', notice: 'User updated successfully' #Try and read on using the locale file for system messages t(users.signup.success)
    else
      # binding.pry
      flash['notice'] = 'User update failed'
       render :edit, notice: 'User update failed' # Please output the errors that were raised(This should accomplished at the View level)
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

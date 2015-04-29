class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Profile created'
      redirect_to login_path
    else
      flash[:danger] = 'Certain fields invalid'
      render 'new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:username,:email,:password)
  end

end

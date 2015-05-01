class UsersController < ApplicationController

  before_action :is_authenticated?, :only => [:create]

  def new
  end

  def show
     @post = Post.where(user_id: @current_user.id)
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

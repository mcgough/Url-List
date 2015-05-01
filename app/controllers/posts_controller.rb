class PostsController < ApplicationController

  before_action :is_authenticated?

  def index

  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = 'Post successful'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
    @post = Post.find_by_id(params[:id])
    @comments = Comment.where(post_id: params[:id])
    @user = current_user
    @vote =Vote.new
    # render :json => @comments
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:title,:link)
  end


  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

end

class PostsController < ApplicationController

  before_action :is_authenticated?, unless: [:index]

  def index
    @post = Post.all
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
    @post = Post.where(user_id: @current_user.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:link)
  end


end

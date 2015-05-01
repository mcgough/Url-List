class CommentsController < ApplicationController



  def create
      # render :json => paams
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    current_user.comments << @comment
    if @comment.save
      # render :plain => 'success'
      redirect_to @post
    end


  end


private

  def comment_params
    params.require(:comment).permit(:body)
  end



end
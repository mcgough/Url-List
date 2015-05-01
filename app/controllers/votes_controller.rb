class VotesController < ApplicationController

  before_action :is_authenticated?

  def create
    if params.key?(:comment_id)
      thing = Comment.find_by_id(params[:comment_id])
      @post = Post.find(params[:post_id])
      home = @post
    elsif params.key?(:post_id)
      thing = Post.find_by_id(params[:post_id])

      home = '/'
    elsif params.key?(:user_id)
       thing = User.find_by_id(params[:user_id])
    else
      return :plain => 'invalid input'
    end


    my_vote = thing.votes.find_by_user_id(current_user.id)

   # current_user.ratings << thing.votes.create(vote_params)

    if my_vote.nil?
      current_user.ratings << thing.votes.create(vote_params)
    else
      if(params[:vote][:value].to_i != my_vote.value)
        my_vote.value = params[:vote][:value]
        my_vote.save
      else
        flash[:danger] = 'You already voted on that'
      end
    end
    redirect_to home
    # render :json => my_vote
    # respond_to do |format|
    #   format.json {render json:{result:true,votes:thing.votes}}
    #   format.html {redirect_to @home}

    end



  private

  def vote_params
    params.require(:vote).permit(:value)
  end

end
class SiteController < ApplicationController

  before_action :is_authenticated?, except: [:index]

  def index
    @posts = Post.all.order(created_at: :desc)
    @vote = Vote.new
    respond_to do |format|
      format.json { render json:@posts }
      format.xml { render xml:@posts }
      format.html
    end
  end


end

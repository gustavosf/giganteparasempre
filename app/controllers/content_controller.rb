class ContentController < ApplicationController

	def index
	end

	def show
		@post = Post.where(slug: params[:slug]).first
    render :index
	end

  def preview
    @post = Post.where(_id: params[:id]).first
    render :index
  end

end

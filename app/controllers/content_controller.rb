class ContentController < ApplicationController

	def index
	end

	def show
		@post = Post.where(slug: params[:slug]).first
	end

  def preview
    @post = Post.where(_id: params[:id]).first
    render :index
  end

end

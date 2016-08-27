class LinksController < ApplicationController

	def index
		@link = Link.new
		@links = Link.all.order('created_at DESC')
	end
	def create		
		@link = Link.new(link_params)
		unless @link.save
			render 'layouts/error'
		end
	end

	private
	 def link_params
      params.require(:link).permit(:title, :given_url)
    end
end

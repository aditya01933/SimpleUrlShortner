class LinksController < ApplicationController

	def index
		@link = Link.new
		@links = Link.all
	end
	def create
		
	end
end

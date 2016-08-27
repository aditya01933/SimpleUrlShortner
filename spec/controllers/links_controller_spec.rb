require 'rails_helper'

RSpec.describe LinksController, type: :controller do
	describe '#POST .create' do
		it 'should create a short url' do
			count = Link.count
			@response = response
			post :create, link: {given_url: "http://www.youtube.com"}, :format => 'js'
			expect(Link.count).to eq(count+1) 
		end
		it 'should return 200 status' do
			expect(@response.status).to be 200
		end
	end
	describe '#GET show' do
		it 'should redirect to given url' do
			link = Link.create(given_url: "http://www.youtube.com")
			get :show, slug: link.slug  
			expect(response).to redirect_to(link.given_url)
		end
		it 'should increase visit count' do
			link = Link.create(given_url: "http://www.youtube.com")
			get :show, slug: link.slug  
			expect(Link.first.clicks).to eq(link.clicks + 1)
		end
	end
	describe '#GET index' do
		it 'should be able to list all links according to pagination' do
			links = Link.all
			get :index
			expect(response).to render_template :index
		end
	end
end

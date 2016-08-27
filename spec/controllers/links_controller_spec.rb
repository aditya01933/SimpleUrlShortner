require 'rails_helper'

RSpec.describe LinksController, type: :controller do
	describe '#POST .create' do
		it 'should create a short url'
		it 'should return 200 status'
	end
	describe '#GET show' do
		it 'should redirect to given url'
		it 'should increase link count'
	end
	describe '#GET index' do
		it 'should be able to list all links according to pagination'
	end
end

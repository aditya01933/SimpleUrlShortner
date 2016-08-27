require 'rails_helper'

RSpec.describe Link, type: :model do
	describe '.generate_slug!' do
		it 'should be able to generate slug' do
			slug = Link.new.generate_slug!
			expect(slug).not_to be nil
		end
	end
	describe '.increment_clicks!' do
		it 'should be able to increase clicks'	do
			link = Link.create(given_url: "http://www.yahoo.com")
			old_count = link.clicks
			new_click_count = link.increment_clicks!
			expect(link.clicks).to eq(old_count+1)
		end
	end
end

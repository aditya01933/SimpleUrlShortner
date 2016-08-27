require 'rails_helper'

RSpec.describe Link, type: :model do

	describe '.increment_clicks!' do
		it 'should be able to increase clicks'	do
			link = Link.create(given_url: "http://www.yahoo.com")
			old_count = link.clicks
			new_click_count = link.increment_clicks!
			expect(link.clicks).to eq(old_count+1)
		end
	end
end

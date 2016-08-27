class Link < ApplicationRecord

	def generate_slug!
    self.slug = self.id.to_s(36)
    self.save!
  end

  def increment_clicks!
  	self.clicks += 1
  	self.save!
  end
  
end

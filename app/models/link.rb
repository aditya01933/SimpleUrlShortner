class Link < ApplicationRecord
	validates :slug, presence: true

	before_validation :generate_slug

  def increment_clicks!
  	self.clicks += 1
  	self.save!
  end

  def short_url
  	"http://adi.tw/" + self.slug 
  end

  protected
  
  	def generate_slug
	    self.slug = loop do
	      random_token = SecureRandom.hex(3)
	      break random_token unless self.class.exists?(slug: random_token)
	    end
  	end
  
end

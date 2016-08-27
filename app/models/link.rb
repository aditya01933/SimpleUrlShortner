class Link < ApplicationRecord
	validates :slug, presence: true

	before_validation :generate_slug, on: :create

  def increment_clicks!
  	new_click = self.clicks += 1
    update(clicks: new_click)
  end

  def short_url
  	"http://localhost:3000/" + self.slug 
  end

  protected
  
  	def generate_slug
	    self.slug = loop do
	      random_token = SecureRandom.hex(3)
	      break random_token unless self.class.exists?(slug: random_token)
	    end
  	end
  
end

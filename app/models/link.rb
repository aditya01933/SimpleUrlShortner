class Link < ApplicationRecord
	validates :slug, presence: true
  validates :given_url, :format => URI::regexp(%w(http https))

	before_validation :generate_slug, on: :create

  def increment_clicks!
  	new_click = self.clicks += 1
    update(clicks: new_click)
  end

  def short_url
  	"http://adi-tw.herokuapp.com/" + self.slug 
  end

  protected
  
  	def generate_slug
	    self.slug = loop do
	      random_token = SecureRandom.hex(3)
	      break random_token unless self.class.exists?(slug: random_token)
	    end
  	end
  
end

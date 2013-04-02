class Link < ActiveRecord::Base
  attr_accessible :user_id, :long_url_id, :short_url_id

  has_many :visits
  has_many :comments
  has_many :taggings
  has_many :tags, :through => :taggings
  belongs_to :user
  has_one :short_url
  has_one :long_url

  def visits_since(minutes_ago)
    Visit.visits_since(id, minutes_ago)
  end

  def number_unique_visitors
    Visit.unique_visitors(id).count
  end

  def self.add(u_id, original_url) #refactor into 2 methods
    return original_url if ShortUrl.matches?(original_url)

    s_url = ShortUrl.create(:short_url_text => SecureRandom.urlsafe_base64(6))
    l_url = if LongUrl.is_original?(original_url)
      LongUrl.create(:long_url_text => original_url)
    else
      original_url
    end

    Link.create(:user_id => u_id, :long_url_id => l_url.id, :short_url_id => s_url.id)
    s_url.short_url_text
  end

end
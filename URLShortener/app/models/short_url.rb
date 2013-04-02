class ShortUrl < ActiveRecord::Base
  attr_accessible :short_url_text

  belongs_to :link

  def self.matches?(original_url)
    ShortUrl.pluck(:short_url_text).include?(original_url)
  end
end
class LongUrl < ActiveRecord::Base
  attr_accessible :long_url_text

  belongs_to :link

  def self.is_original?(original_url)
    !LongUrl.pluck(:long_url_text).include?(original_url)
  end
end
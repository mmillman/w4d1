class Tag < ActiveRecord::Base
  attr_accessible :category

  has_many :taggings
  has_many :links, :through => :taggings

  def self.has_category?(category)
    Tag.pluck(:category).include?(category)
  end
end
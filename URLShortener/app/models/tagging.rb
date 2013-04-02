class Tagging < ActiveRecord::Base
  attr_accessible :tag_id, :link_id

  belongs_to :link
  belongs_to :tag
end
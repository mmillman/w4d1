class Comment < ActiveRecord::Base
  attr_accessible :link_id, :user_id, :text

  belongs_to :link
  belongs_to :user
end
class Visit < ActiveRecord::Base
  attr_accessible :link_id, :user_id

  belongs_to :link
  belongs_to :user

  # scope
  def self.since(minutes_ago)
    where(
      "updated_at > :cutoff_time",
      { :cutoff_time => Time.now - (minutes_ago * 60) }
    )
  end


  def self.unique_visitors(l_id)
    where("link_id = :l_id", { :l_id => l_id }).uniq.pluck(:user_id)
  end
end
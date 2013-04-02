class User < ActiveRecord::Base
  attr_accessible :email, :username

  has_many :comments
  has_many :links
  has_many :visits

  def add_comment(l_id, comment_text)
    comments.create(:link_id => l_id, :text => comment_text)
  end

  def shorten(original_url)
    Link.add(id, original_url)
  end

  def assign_tags(link_id, *args)
    valid_tags = args.select { |category| Tag.has_category?(category) }

    valid_tags.each do |tag|
      Tagging.create(:tag_id => Tag.find_by_category(tag).id, :link_id => link_id)
    end
  end
end
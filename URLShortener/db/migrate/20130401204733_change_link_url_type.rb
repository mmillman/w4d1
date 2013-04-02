class ChangeLinkUrlType < ActiveRecord::Migration
  def up
    change_column :links, :long_url, :string, :limit => 1024
    change_column :links, :short_url, :string, :limit => 1024
  end

  def down
    change_column :links, :long_url, :text
    change_column :link, :short_url, :text
  end
end

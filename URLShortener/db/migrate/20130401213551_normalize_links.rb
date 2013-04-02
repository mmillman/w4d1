class NormalizeLinks < ActiveRecord::Migration
  def up
    remove_column :links, :short_url
    remove_column :links, :long_url
    add_column :links, :short_url_id, :integer
    add_column :links, :long_url_id, :integer

  end

  def down
    remove_column :links, :short_url_id, :integer
    remove_column :links, :long_url_id, :integer
    add_column :links, :short_url
    add_column :links, :long_url
  end
end

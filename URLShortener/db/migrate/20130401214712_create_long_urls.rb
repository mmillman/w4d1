class CreateLongUrls < ActiveRecord::Migration
  def change
    create_table :long_urls do |t|
      t.string :long_url_text

      t.timestamps
    end
  end

end

class CreateShortUrLs < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :short_url_text

      t.timestamps
    end
  end
end

class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id
      t.text :long_url
      t.text :short_url
      t.timestamps
    end
  end
end

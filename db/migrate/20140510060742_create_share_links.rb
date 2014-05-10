class CreateShareLinks < ActiveRecord::Migration
  def change
    create_table :share_links do |t|
      t.string :original_url
      t.string :shorten_url

      t.timestamps
    end
  end
end

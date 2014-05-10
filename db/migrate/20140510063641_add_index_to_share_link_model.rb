class AddIndexToShareLinkModel < ActiveRecord::Migration
  def change
    add_index :share_links, :original_url, unique: true
    add_index :share_links, :shorten_url, unique: true
  end
end

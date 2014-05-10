class CreateShareLinks < ActiveRecord::Migration
  def change
    create_table :share_links do |t|

      t.timestamps
    end
  end
end

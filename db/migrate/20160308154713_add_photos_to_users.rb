class AddPhotosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photos, :text
  end
end

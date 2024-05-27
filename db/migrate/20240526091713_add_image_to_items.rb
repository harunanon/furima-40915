class AddImageToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :image, :string, null: false
  end
end

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :text
      t.integer :genre_id, null:false
      t.integer :quality_id, null:false
      t.integer :payment_id, null:false
      t.integer :region_of_origin_id, null:false
      t.integer :delivery_day_id, null:false
      t.integer :price, null:false
      t.references :user, null:false, foreign_key:true

      t.timestamps
    end
  end
end

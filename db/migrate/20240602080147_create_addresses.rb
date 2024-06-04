class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :post_code, null: false
      t.integer :region_of_origin_id, null: false
      t.string :municipality, null: false
      t.string :street_address, null: false
      t.string :building_name
      t.references :order, null:false, foreign_key: true
      t.timestamps
    end
  end
end

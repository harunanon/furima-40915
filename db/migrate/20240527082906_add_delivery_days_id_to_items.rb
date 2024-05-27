class AddDeliveryDaysIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :delivery_days_id, :integer, null: false
  end
end

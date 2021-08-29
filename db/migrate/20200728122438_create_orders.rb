class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :end_user_id
      t.string :ship_name
      t.string :ship_postcode
      t.string :ship_toaddress
      t.integer :status, default: 0, null: false
      t.integer :payment_method, default: 0, null: false
      t.integer :postage
      t.integer :total_due
      t.timestamps
    end
  end
end

class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.integer :unitprice
      t.integer :production_status, null: false, default: "0"
      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :price
      t.string :image_id
      t.boolean :sales_status, null: false, default: "false"
      t.timestamps
    end
  end
end

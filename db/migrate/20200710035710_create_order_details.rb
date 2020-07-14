class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :item
      t.float :quantity
      t.references :order
      
      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.boolean :self_pickup, default: true

      t.timestamps
    end
  end
end

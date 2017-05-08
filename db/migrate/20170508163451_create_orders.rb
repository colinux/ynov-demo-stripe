class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :state
      t.references :book
      t.monetize :amount
      t.json :payment

      t.timestamps
    end
  end
end

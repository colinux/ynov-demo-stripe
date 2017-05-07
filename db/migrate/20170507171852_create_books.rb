class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.monetize :price

      t.timestamps
    end
  end
end

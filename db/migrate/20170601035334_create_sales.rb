class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.float :sale_price
      t.float :offer_price
      t.references :product, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end

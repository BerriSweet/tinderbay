class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.references :User, foreign_key: true
      t.string :product_details

      t.timestamps
    end
  end
end

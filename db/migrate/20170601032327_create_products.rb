class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_details
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

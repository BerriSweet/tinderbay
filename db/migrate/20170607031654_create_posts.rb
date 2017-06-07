class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.float :sale_price
      t.datetime :date_listed
      t.references :Product, foreign_key: true
      t.references :User, foreign_key: true

      t.timestamps
    end
  end
end

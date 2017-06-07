class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.datetime :date_of_birth
      t.string :password_digest
      t.string :email
      t.boolean :is_admin

      t.timestamps
    end
  end
end

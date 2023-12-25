class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone_number
      t.boolean :gender
      t.string :password
      t.string :confirm_password

      t.timestamps
    end
  end
end

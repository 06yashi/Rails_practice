class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :middlename
      t.string :surname
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end

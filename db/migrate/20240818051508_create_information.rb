class CreateInformation < ActiveRecord::Migration[7.2]
  def change
    create_table :information do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.string :age
      t.string :integer
      t.string :subject

      t.timestamps
    end
  end
end

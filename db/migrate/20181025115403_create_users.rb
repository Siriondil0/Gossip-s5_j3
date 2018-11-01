class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.belongs_to :city, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :description
      t.integer :age
      t.string :password
      t.timestamps
    end
  end
end

class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.belongs_to :user, optional: true , index: true
      t.string :title
      t.text :content
      t.datetime :date
      t.timestamps
    end
  end
end

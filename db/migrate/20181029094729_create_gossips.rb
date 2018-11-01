class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :content
      t.datetime :date
      t.timestamps
    end
  end
end

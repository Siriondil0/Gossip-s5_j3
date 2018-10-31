class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      belongs_to :user, optional: true
      t.string :author
      t.text :content
      t.datetime :date
      t.timestamps
    end
  end
end

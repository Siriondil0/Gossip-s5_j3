class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :likable, polymorphic: true, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.references :commentable, polymorphic: true, index: true
      t.text :content
      t.timestamps
    end
  end
end

class CreateJoinTablePmsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :pms, :users do |t|
      t.index [:pm_id, :user_id]
      t.index [:user_id, :pm_id]
    end
  end
end

class RemoveColumnToComments < ActiveRecord::Migration[6.1]
  def up
    change_column :comments, :master_id, :integer, null: true
  end

  def down
    change_column :comments, :master_id, :integer, null: false
  end
end

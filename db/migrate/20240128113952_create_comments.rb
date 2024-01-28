class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :design_id, null: false
      t.integer :master_id, null: false
      t.text :comment, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end

class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :user_id, null: false
      t.integer :comment_id
      t.integer :design_id 
      t.text :introduction, null: false
      t.boolean :status, null: false, default: false
      t.timestamps
    end
  end
end

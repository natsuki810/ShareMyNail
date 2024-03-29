class CreateDesigns < ActiveRecord::Migration[6.1]
  def change
    create_table :designs do |t|
      t.integer :user_id, null: false
      t.integer :color_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end

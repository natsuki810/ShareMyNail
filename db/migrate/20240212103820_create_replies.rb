class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.timestamps
      t.integer "user_id", null: false
      t.integer "comment_id", null: false
      t.text "content", null: false
      t.boolean "is_active", default: true, null: false
    end
  end
end

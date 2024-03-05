class CreateUserMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :user_messages do |t|
      t.string :content
      t.references :conversation, null: false, foreign_key: true
      t.references :bot_message, null: false, foreign_key: true
      t.string :feedback

      t.timestamps
    end
  end
end

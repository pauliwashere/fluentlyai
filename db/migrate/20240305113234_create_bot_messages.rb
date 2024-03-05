class CreateBotMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :bot_messages do |t|
      t.string :content
      t.references :conversation, null: false, foreign_key: true

      t.timestamps
    end
  end
end

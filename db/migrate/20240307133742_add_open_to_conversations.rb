class AddOpenToConversations < ActiveRecord::Migration[7.1]
  def change
    add_column :conversations, :open, :boolean, default: true
  end
end

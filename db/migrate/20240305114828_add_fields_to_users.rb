class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :level, :string
    add_column :users, :score, :integer
  end
end

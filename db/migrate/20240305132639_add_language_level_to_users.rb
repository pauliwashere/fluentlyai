class AddLanguageLevelToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :language_level, :string
  end
end

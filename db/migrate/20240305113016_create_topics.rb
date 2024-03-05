class CreateTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :description
      t.string :level

      t.timestamps
    end
  end
end

class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :card_id
      t.string :name
      t.string :imageUrl
      t.string :types

      t.timestamps null: false
    end
  end
end

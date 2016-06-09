class UsersCards < ActiveRecord::Migration
  def change
    create_table :users_cards, :id => false do |t|
      t.integer :card_id
      t.integer :user_id
    end
  end
end

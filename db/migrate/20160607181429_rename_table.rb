class RenameTable < ActiveRecord::Migration
  def self.up
    rename_table :users_cards, :cards_users
  end

  def self.down
    rename_table :cards_users, :users_cards
  end
end

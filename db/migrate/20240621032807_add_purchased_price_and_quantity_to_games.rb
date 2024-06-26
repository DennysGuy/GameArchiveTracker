class AddPurchasedPriceAndQuantityToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :purchased_price, :float
    add_column :games, :quantity, :integer
  end
end

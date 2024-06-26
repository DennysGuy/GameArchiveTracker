class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :game_art
      t.string :title
      t.string :platform
      t.string :publisher
      t.string :developer
      t.string :genre
      t.string :series
      t.integer :release_year
      t.date :date_purchase
      t.string :condition
      t.string :items_included
      t.string :region
      t.string :description

      t.timestamps
    end
  end
end

class Game < ApplicationRecord
  belongs_to :user
  validates :game_art, :title, :platform, :publisher, :developer, :genre, :series, :release_year, :date_purchase, :condition, :items_included, :region, :description, presence: true
end

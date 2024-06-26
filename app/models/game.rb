class Game < ApplicationRecord
  belongs_to :user
  validates :game_art, :title, :platform, :publisher, :developer, :genre, :series, :release_year, :date_purchase, :condition, :items_included, :region, :description, presence: true
  def self.ransackable_attributes(auth_object=nil)
    ["title", "platform", "publisher", "developer", "series", "description"]
  end
end

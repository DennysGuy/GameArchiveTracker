json.extract! game, :id, :game_art, :title, :platform, :publisher, :developer, :genre, :series, :release_year, :date_purchase, :condition, :items_included, :region, :description, :created_at, :updated_at
json.url game_url(game, format: :json)

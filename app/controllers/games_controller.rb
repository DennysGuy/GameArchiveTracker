class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: %i[show edit update destroy]

  # GET /games or /games.json
  def index
    @games = current_user.games
    @q = current_user.games.ransack(params[:q])
    @games = @q.result(distinct: true)
    @total_cost = current_user.games.sum(:purchased_price)

    @platform_filter = session[:platform_filter] || "All Platforms"
    @publisher_filter = session[:publisher_filter] || "All Publishers"
    @genre_filter = ""
    @release_year_filter = ""
    @region_filter = ""
    @mode_filter = ""
    @developer_filter = ""
    @condition_filter = ""
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = current_user.games.build(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy!
    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def set_platform_filter
    session[:platform_filter] = params[:platform]
    respond_to do |format|
      format.json { render json: { platform_filter: session[:platform_filter] } }
    end
  end

  def set_publisher_filter
    session[:publisher_filter] = params[:publisher]
    respond_to do |format|
      format.json { render json: { publisher_filter: session[:publisher_filter] } }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:game_art, :title, :platform, :publisher, :developer, :genre, :series, :release_year, :date_purchase, :condition, :items_included, :region, :description, :purchased_price, :quantity)
  end
end

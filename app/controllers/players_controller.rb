class PlayersController < ApplicationController
  def index
    @players = Player.all.order(player_params[:sort] || :last_name)
  end

  def show
    @player = Player.find(player_params[:id])
    @my_bid = Bid.find_by(player_id: player_params[:id], user_id: current_user.id)
  end

  private

  def player_params
    params.permit(:id, :sort)
  end
end

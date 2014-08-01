class HomeController < ApplicationController
  def index
    @coins = Coin.order("num_coins DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coins }
    end
  end
end

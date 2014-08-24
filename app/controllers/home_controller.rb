class HomeController < ApplicationController
  def index
    @coins = Coin.order("num_coins DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coins }
    end
  end

  def mash
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    string = (0...50).map { o[rand(o.length)] }.join

    Mash.create!({:val => string})

    render json: {"result" => string}
  end

  def ips
    if params[:mash].nil?
      render json: {"result" => "error"}
      return
    end
    db_mash = Mash.where(:val => params[:mash]).first
    if db_mash.nil?
      render json: {"result" => "error"}
      return
    end

    db_rpi_ip = RpiIp.where(:rpi_id => params[:rpi_id]).first
    db_rpi_ip = RpiIp.create!({:rpi_id => params[:rpi_id]}) if db_rpi_ip.nil?

    db_rpi_ip.ip = request.remote_ip
    db_rpi_ip.ping = DateTime.now
    db_rpi_ip.save!

    db_mash.destroy

    render json: {"result" => "success"}
  end
end

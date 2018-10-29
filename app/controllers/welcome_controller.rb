class WelcomeController < ApplicationController
  def show
    @my_name_param = params[:id]
    @gossip = Gossip.all
  end
  def index
    @gossip = Gossip.all
  end
end

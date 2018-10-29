class WelcomeController < ApplicationController
  def show
    my_name_param = params[:id]
  end
  def index
    @gossip = Gossip.all
  end
end

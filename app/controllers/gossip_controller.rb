class GossipController < ApplicationController
  def show
    my_name_param = params[:id]
    puts my_name_param
    @gossip=Gossip.all
    @good_gossip=@gossip[my_name_param.to_i-1]
  end


end
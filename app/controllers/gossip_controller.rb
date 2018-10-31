class GossipController < ApplicationController
  def show
    my_name_param = params[:id]
    puts my_name_param
    @gossip=Gossip.all
    @good_gossip=@gossip[my_name_param.to_i-1]
  end

  def new
    @gossip = Gossip.new
  end

  def create 
    # if params[:gossip][:user] 
    #   @gossip = Gossip.create!(user: params[:gossip][:user], title: params[:gossip][:title], content: params[:gossip][:content], date: Time.now)
    # else 
      anonymus=User.new(first_name: "Anonymus").save
      @gossip = Gossip.create!(user: anonymus, title: params[:gossip][:title], content: params[:gossip][:content], date: Time.now)
    # end
    url="/gossip/" + @gossip.id.to_s
    puts url
    redirect_to(url)
  end
  
  


end
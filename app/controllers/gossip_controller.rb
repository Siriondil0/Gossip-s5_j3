class GossipController < ApplicationController
  
  def index
    @gossip = Gossip.all
  end
  def index_perso
    @my_name_param = params[:id]
    @gossip = Gossip.all
  end
  
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
      @u=User.create!(city:City.first, first_name: "Ano", last_name: "Nimus", email: "ano.nimus@anomymus.com")
      @gossip = Gossip.create!(user: @u, title: params[:gossip][:title], content: params[:gossip][:content], date: Time.now)
    # end
    url="/gossip/" + @gossip.id.to_s
    puts url
    redirect_to(url)
  end

  def edit
    my_name_param = params[:id]
    puts my_name_param
    @gossip=Gossip.all
    @good_gossip=@gossip[my_name_param.to_i-1]
  end
  
  def uptade
  end

  def destroy 
  end
  
  


end
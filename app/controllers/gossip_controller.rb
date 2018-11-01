class GossipController < ApplicationController
  
  def index
    @gossip =Gossip.order(:id) 

  end
  
  def show
    @comment = Comment.order(:id)
    @good_coms = []
    @good_gossip = Gossip.find(params[:id])
    @comment.each do |comment|
      if comment.commentable == @good_gossip
        @good_coms << comment
      end
    end
    @good_comment = Comment.new
    @number_likes = []
    @good_gossip = Gossip.find(params[:id])
    @like = Like.order(:id)
    @like.each do |like|
      if like.likable == @good_gossip
        @number_likes << like
      end
    end
    @good_like = Like.new
  end

  def new
    @gossip = Gossip.new
  end

  def create 
    if session[:user_id] 
      @u = User.find(session[:user_id])
    else 
      @u=User.create!(city:City.first, first_name: "Ano", last_name: "Nimus", email: "ano.nimus@anomymus.com")
    end
    @gossip = Gossip.create!(user: @u, title: params[:gossip][:title], content: params[:gossip][:content], date: Time.now)
    url="/gossip/" + @gossip.id.to_s
    redirect_to(url)
  end

  def edit
    @gossip = Gossip.find(params[:id])
    @user = User.new
    @city_user = City.new
  end
  
  def update
    @gossip = Gossip.find(params[:id])
    # @city_all.each do |city|
    #   if city_exist(city, params[:postal])
    #     @city_user = city_exist(city, params[:postal])
    #   end
    # end
    # @user_all.each do |user|
    #   if user_exist(user, params[:first_name], params[:last_name], params[:email])
    #     @user_here = user_exist(user, params[:first_name], params[:last_name], params[:email])
    #   end
    # end
    # # différends cas suivant si l'user existe déjà, ou si la ville existe déjà
    # if @user_here
    #   if @city_user
    #     if @user_here.city_id == @city_user.id
    #       @gossip = @gossip.uptade_attributes(user: @user_here, title: params[:gossip][:title], content: params[:gossip][:content], date: Time.now)
    #     else
    #       @user_here = @user_here.update_attributes(city: @city_user)
    #       @gossip = @gossip.uptade_attributes(user: @user_here, title: params[:gossip][:title], content: params[:gossip][:content], date: Time.now)
    #     end
    #   end
    # elsif @city_user
    #   @user_here = User.create!(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: @city_user)
    #   @gossip = @gossip.update_attributes(user: @user_here, title: params[:gossip][:title], content: params[:gossip][:content], date: Time.now)
    # else
    @city_user = City.create!( name: params[:city], postal_code: params[:postal]) 
    @user = User.create!(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: @city_user)
    @gossip.update_attributes!(user: @user, title: params[:title], content: params[:content], date: Time.now)
    
    url="/gossip/" + (@gossip.id-1).to_s
    redirect_to(url)
  end

  # def city_exist(city,postal)
  #   if city.postal_code == postal
  #     return city
  #   end
  # end

  # def user_exist (user, first_name, last_name,email)
  #   if user.first_name == first_name && user.last_name == last_name && user.email == email
  #     return user
  #   end
  # end


  def destroy 
    if session[:user_id]
      @gossip = Gossip.find(params[:id])
      user = User.find(session[:user_id])
      if user == @gossip.user
        
        @gossip.destroy
      end
    end
    redirect_to("/gossip")
  end
  
  


end
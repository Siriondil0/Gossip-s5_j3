class HomeController < ApplicationController
  def index
  end
    
  def login
    @current_user = User.new
  end
    
  def check
    @current_user = User.where(email: params[:user][:email], password: params[:user][:password]).first
    if @current_user
      session[:user_id] = @current_user.id
      puts session[:user_id]
      flash[:info] = "Vous êtes maintenant connecté"
      redirect_to "/home"
    else
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      puts "Echec"
      redirect_to "/home/login"
    end
  end

  def deconnect
    session[:user_id] = nil
    flash[:info] = "User déconnecté"
    redirect_to "/home"
  end

end

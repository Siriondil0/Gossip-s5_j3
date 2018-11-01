class RegistrationController < ApplicationController

  def new
    @user = User.new
  end

  def create 
    @user = User.create!(city:City.first, first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], password: params[:user][:password])
    
    redirect_to('/')
  end

  #validates :first_name, presence: true
  #validates :last_name, presence: true
  #validates :email, presence: true
  #validates :password, presence: true

end

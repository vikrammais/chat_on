# require 'byebug'
class RegisterController < ApplicationController

  def new
  end

  def create
  	if params[:password] != params[:confirm_password]
  		render :text => "Passwords do not match"
  	elsif (User.where("lower(user_name) = ? OR lower(email) = ?", params[:user_name].downcase, 
        params[:email].downcase).blank?)
	  @user = User.new(:user_name => params[:user_name], :email => params[:email], 
	  	:password => params[:password], :name => params[:name])
	  @user.save
	  @result = User.find_by_user_name(params[:user_name]);
	  puts @result['name']
	else
	  render :text => "User Already Exists!"
	end  
  end

  def destroy
  end
end

class UserOperationsController < ApplicationController

  before_action :user_is_logged_in

  def search
  	# @user = User.find_by_user_name(params[:user_name])
    @users = []
    User.where("lower(user_name) = ? OR lower(name) = ?", params[:user_name].downcase, 
        params[:user_name].downcase).each do |user|
      @users.push(user)
    end  
  # 	if !@user.blank?
	 #  if (@user[:id] > session[:user_id])
  #   	user_one_id = session[:user_id]
  # 	    user_two_id = @user[:id]
  # 	  else
  #   	user_one_id = @user[:id]
  # 	    user_two_id = session[:user_id]
  # 	  end
  # 	  @friend = Friend.where("user_one_id = ? AND user_two_id = ?", user_one_id, user_two_id)
 	# else
  # 	  render :text => "User doesn't Exist"
  # 	end	
  end

  def send_friend_request
  	if (params[:user_id].to_i > session[:user_id])
  	  user_one_id = session[:user_id]
  	  user_two_id = params[:user_id].to_i
  	else
  	  user_one_id = params[:user_id].to_i
  	  user_two_id = session[:user_id]
  	end
  	@friend = Friend.new(:user_one_id => user_one_id, :user_two_id => user_two_id, 
  	  	:status => 0, :action_user_id => session[:user_id])
  	@friend.save
  end

  def friend_request_accept
  	# @friendship_status = Friend.find_by_action_user_id(params[:id].to_i)
    if params[:id].to_i > session[:user_id]
      user = "user_one_id"
    else 
      user = "user_two_id"
    end
    @friendship_status = Friend.where("action_user_id = ? AND #{user} = ?", params[:id].to_i, session[:user_id].to_i).first
    # puts @friendship_status["status"]
    # byebug
  	@friendship_status[:status] = 1
  	@friendship_status[:action_user_id] = session[:user_id].to_i
  	@friendship_status.save
  end

  def messages
  end

  def notifications
  end
end

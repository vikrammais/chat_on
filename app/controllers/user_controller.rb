class UserController < ApplicationController

  before_action :user_is_logged_in

  def user_data
  	@user = User.find_by_id(params[:user_id].to_i)
  	if (session[:user_id] != params[:user_id])
  	  if (session[:user_id] > params[:user_id].to_i)
  	  	user_one_id = params[:user_id]
  	  	user_two_id = session[:user_id]
  	  else
  	    user_one_id = session[:user_id]
  	    user_two_id = params[:user_id]
  	  end	
      @relation = Friend.where("user_one_id = ? AND user_two_id = ?", user_one_id, user_two_id)
      if !@relation[0].blank?
      	if (@relation[0][:status]==0)
      		if (@relation[0][:action_user_id]==params[:user_id].to_i)
      		  @status = "Accept"
      		else
      		  @status = "Sent"
      		end
      	else
      	  @status = "Friends"
      	end
      else
        @status = "Send"
      end	  	  
  	else
  	end 
  end

  def friends_list
  	@user = User.find_by_id(params[:id])
	@friends_list = {}
	Friend.where("(user_one_id = ? OR user_two_id = ?) AND status = ?", 
	  	params[:id].to_i, params[:id].to_i,1).each do |row|
      if (params[:id] == row[:user_one_id].to_s)
      	friend_id = row[:user_two_id]
      else
        friend_id  = row[:user_one_id]
      end
      @friend = User.find_by_id(friend_id)
      @friends_list[friend_id] = @friend[:name]
	end
  end

end

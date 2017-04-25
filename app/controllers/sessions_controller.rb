class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_user_name(params[:user_name])
  	if @user and @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		@friends_pending = Hash.new
  		Friend.where("(user_one_id = ? OR user_two_id = ?) AND action_user_id != ? AND status = ?", 
  			@user[:id], @user[:id], @user[:id],0).each do |row|
          if row[:user_two_id] == @user[:id]
            friend_id = row[:user_one_id]
          else
            friend_id = row[:user_two_id]
          end
          friend_pending = User.find_by_id(friend_id)
          @friends_pending[friend_id] = friend_pending[:name]
  		end
      puts @friends_pending
  	else
  	  render :text => "Wrong Details Entered"
  	end	
  end

  def destroy
  	session[:user_id] = nil
    redirect_to "/"
  end
end

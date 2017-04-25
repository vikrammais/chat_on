class ConversationsController < ApplicationController
  
  before_action :user_is_logged_in
  
  def show_messages
    # puts "QETYTRDEGRD"
  	@user_id = params[:user_id].to_i
  	friend = User.find_by_id(@user_id)
  	@conversation = []
  	Conversation.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)",
  		@user_id, session[:user_id], session[:user_id], @user_id).each do |conversation|
  	  if conversation[:sender_id] == @user_id
  	  	name = friend[:name]
  	  else
  	  	name = "You"
  	  end
  	  @conversation.push([name,conversation[:message]])
  	end
  end

  def send_message
  	@message = Conversation.find_by_sender_id(session[:user_id])
  	@message = Conversation.new(:sender_id => session[:user_id], :receiver_id => params[:user_id], 
  		:message => params[:message])
  	@message.save
    @refresh = true
    @user_id = params[:user_id]
  end
end

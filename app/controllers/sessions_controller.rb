class SessionsController < ApplicationController
  def new
  end

  def create


  	if not user.empty?
  		if user.try(:authenticate, params[:user][:password])
  			session[:user_id] = user.id

  			return redirect_to user_path user.id
  		end
  		flash[:errors] = ['Incorrect password']
  	else
  		flash[:errors] = ['Account not found, please register first.']
  	end	

  	return redirect_to session_path 
  end

  def destroy
  	session.delete(:user_id) if session[:user_id]
  	return redirect "users/new.html.erb"
  end


end

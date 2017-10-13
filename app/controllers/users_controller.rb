class UsersController < ApplicationController

	def new
		return render "users/new.html.erb"
	end

	def create
		user = User.create(user_params)
		if user.valid?
			session[:user_id]= user.id
			return redirect_to user_path user.id
		end
		
		flash[:errors] = user.errors.full_messages		

		return redirect_to :back
	end

	def show
		@user = User.find(params[:id])
		return render "/users/show.html.erb"
	end	

	private
		def user_params
			params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
		end	

end

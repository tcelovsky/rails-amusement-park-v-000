class UsersController < ApplicationController  
	def new
    end

	def create
		@user = User.create(user_params)
        if params[:password] == params[:password_confirmation]
		session[:user_id] = @user.id
        redirect_to user_path(@user)
        else render :new_user
        end
	end  
  
	def show
        @user = User.find_by(params[:name])
	end

	def index
		@users = User.all
	end
	
	private
	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
	end

end
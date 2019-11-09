class UsersController < ApplicationController
	
	def new
		@user=User.new
	end

	def create
		@user=User.create(params[:user_name, :email, :password])
	end

	def update
		
		if @user.update(user_params)
			redirect_to user_show_path(@user)
		else 
			render 'edit'
		end

	end

	def edit
		redirect to edit_user_registration_path(@user)
	end

	def delete
		@user.destroy
		redirect_to user_show_path(@user)
	end

	def show
		@user=User.all
	end

	private

	def user_params
			params.require(:user).permit(:user_name, :email, :password)
	end 

	def find_user
		@user=User.find(user_id)
	end

end

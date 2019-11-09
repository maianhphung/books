class ProfilesController < ApplicationController

	before_action :find_user
	before_action :set_profile, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def new
		# @profile = current_user.build_profile
		@profile = current_user.create_profile
	end

	def create
		@profile = current_user.build_profile(profile_params)
		@profile.user_id = current_user.id

		if @profile.save
			#redirect_to user_profile_path(user_id: current_user.id)
			redirect_to "/users/#{current_user.id}/profiles/#{current_user.profile.id}"
		else
			render 'new'
		end 

	end 

	def edit
	end

	def update
		if @profile.update(profile_params)
			redirect_to "/users/#{current_user.id}/profiles/#{current_user.profile.id}"
		else 
			render 'edit'
		end 
	end	

	def destroy
		@profile.destroy
		redirect_to users_path(current_user)
	end

	def index
	end


	private 
		def profile_params
			params.require(:profile).permit(:first_name,:last_name, :about, :city, :state, :image)
		end

		def set_profile
			@profile = Profile.find(params[:id])
		end 

		def find_user
			@user = current_user
		end

end

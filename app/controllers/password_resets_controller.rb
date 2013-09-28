class PasswordResetsController < ApplicationController

	def create
	  @user = User.find_by_email(params[:email]) 
	  if @user
	  	@user.send_password_reset
	  end
	  redirect_to root_url, notice: t(:email_sent_with_password_reset_instructions)
	end

	def edit
	  @user = User.find_by_password_reset_token!(params[:id])
	end

	def update
	  @user = User.find_by_password_reset_token!(params[:id])
	  if @user.password_reset_sent_at < 2.hours.ago
	    redirect_to new_password_reset_path, :alert => t(:password_reset_has_expired)
	  elsif @user.update_attributes(params[:user])
	    redirect_to root_url, :notice => t(:password_has_been_reset)
	  else
	    render :edit
	  end
	end
end

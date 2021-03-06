class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy
  before_filter :not_signed_in_user, only: [:new, :create]

  def index
    @users= User.paginate(page: params[:page])
  end

  def new
    # mail=UserMailer.test_email.deliver
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @user.notify_new_user
      sign_in @user
      flash[:success] = t(:welcome_to_aksts)
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = t(:profile_updated)
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    usr=User.find(params[:id])
    if (usr!=current_user)
      usr.destroy
      flash[:success] = t(:user_destroyed)
    else
      flash[:error] = t(:you_can_not_delete_youself)
    end
    redirect_to users_url
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def not_signed_in_user
    if signed_in?
      redirect_to(root_url)
    end
  end
end

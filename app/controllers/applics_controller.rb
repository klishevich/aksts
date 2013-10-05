class ApplicsController < ApplicationController
  before_filter :signed_in_user
  before_filter :have_no_applic, only: [:new, :create]
  before_filter :admin_user, only: :index

  include ApplicsHelper

  def index
    @applics=Applic.paginate(page: params[:page])
  end

  def new
    @applic = current_user.build_applic
  end

  def create
    @applic = current_user.build_applic(params[:applic])
    if @applic.save
      flash[:success] = t(:application_sent)
      redirect_to @applic
    else
      render 'new'
    end
  end

  def show
  	if current_user.admin? 
      @applic = Applic.find(params[:id])
    else
      @applic||=current_user.applic
    end
  end

  def edit
  	@applic=current_user.applic
  end

  def update
    @applic = current_user.applic
    if @applic.update_attributes(params[:applic])
      flash[:success] = t(:application_updated_successfuly)
      redirect_to @applic
    else
      render 'edit'
    end
  end

end

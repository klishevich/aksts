class ApplicsController < ApplicationController
  before_filter :signed_in_user
  before_filter :have_no_applic, only: [:new, :create]
  before_filter :admin_user, only: :index

  include ApplicsHelper
  # include ApplicReport

  def index
    @applics=Applic.paginate(page: params[:page])
    # output = ApplicReport.new.to_pdf

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.pdf do
    #     send_data output, filename: "hello.pdf", 
    #                       type: "application/pdf"
    #   end
    # end
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
    # pdf = Prawn::Document.new
    # pdf.text "Hello World"
    # pdf.render_file "assignment.pdf"
    pdf = ApplicReport.new
    pdf.generate(@applic)
    respond_to do |format|
      format.html
      format.pdf do
        send_data pdf.render, type: "application/pdf", disposition: "inline"
      end          
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

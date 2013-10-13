class MessagesController < ApplicationController

  before_filter :signed_in_user
  before_filter :admin_user, exept: [:index, :show]

  include ApplicsHelper

  def index
    @messages=Message.paginate(page: params[:page])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      @message.deliver if @message.send_to_subscribers
      @message.send_twitter if @message.send_to_twitter
      flash[:success] = t(:message_saved)
      redirect_to @message
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
  	@message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(params[:message])
      flash[:success] = t(:message_updated_successfuly)
      redirect_to @message
    else
      render 'edit'
    end
  end

end

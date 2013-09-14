module ApplicsHelper
	
  def have_applic
  	current_user.applic
  end

  def have_no_applic
    unless !have_applic
      redirect_to current_user.applic, notice: "You already have application!"
    end
  end

end

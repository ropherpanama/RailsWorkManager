class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private 
  
  def confirm_logged_in
    unless session[:user_id]
	  flash[:warning] = "Por favor inicie sesion o registrese"
	  redirect_to(:controller => 'access', :action => 'login')
	  return false
	else
	  @loged_user = Usuario.find(session[:user_id])
	  return true
	end
  end
  
end

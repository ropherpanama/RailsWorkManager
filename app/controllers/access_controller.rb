class AccessController < ApplicationController
  
  #layout 'admin'
  # Esto permitira confirmar que el usuario puede navegar por la aplicacion
  before_action :confirm_logged_in, :except => [:login, :sign_up, :attempt_login, :logout]
  
  def index
    @usuario = Usuario.find(session[:user_id])
  end

  def login
  end
  
  def sign_up
    @perfiles = Perfil.where.not(:nombre => 'ADMIN')
    @usuario = Usuario.new
  end
  
  def attempt_login
    if params[:username].present? && params[:password].present?
	
	  found_user = Usuario.where(:nickname => params[:username]).first
	  
	  if found_user
	    authorized_user = found_user.authenticate(params[:password])
	  end
	end
	
	if authorized_user
	  #Init of the session
	  session[:user_id] = authorized_user.id
	  session[:username] = authorized_user.nickname
	  flash[:success] = "Bienvenido " + authorized_user.nombre + " " + authorized_user.apellido
	  redirect_to(:action => 'index')
	else
	  flash[:danger] = "Combinacion username/password incorrecta"
	  redirect_to(:action => 'login')
	end
  end 
  
  def logout
    #Destroy the session
    session[:user_id] = nil
	session[:username] = nil
    flash[:info] = "Logged out"
	redirect_to(:action => 'login')
  end
  
end

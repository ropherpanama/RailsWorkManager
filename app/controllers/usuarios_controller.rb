class UsuariosController < ApplicationController 

  before_action :confirm_logged_in, :except => [:create] # para permitir el sign_up
  
  def new
    @perfiles = Perfil.all
    @usuario = Usuario.new
  end
  
  def index
    @usuarios = Usuario.all.paginate(page: params[:page], per_page: 10)
  end
  
  def create
    @usuario = Usuario.new(user_params)
	@perfil = Perfil.find(params[:user_perfil])
	@usuario.perfil = @perfil # set the reference
    #Con las validaciones puestan en el model se debe validar el retorno del metodo save
    if @usuario.save
	  flash[:success] = "Registro guardado!"
      redirect_to usuarios_path
	else
	  if session[:username]
		@perfiles = Perfil.all
		render 'new'
	  else
	    @perfiles = Perfil.where.not(:nombre => 'ADMIN')
		render 'access/sign_up'
      end # fin unless
	  
	end
	
  end
  
  def edit
    @usuario = Usuario.find(params[:id])
	@perfiles = Perfil.all
  end 
  
  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update(user_params)
	  flash[:success] = "Registro editado!"
      redirect_to @usuario
    else
	  @perfiles = Perfil.all
      render 'edit'
    end
  end
  
  def show
    @usuario = Usuario.find(params[:id])
  end
  
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    flash[:success] = "Registro eliminado"
    redirect_to usuarios_path
  end
  
  private
  def user_params
    params.require(:usuario).permit(:nombre, :apellido, :nickname, :password, :password_confirmation, :user_perfil)
  end
end

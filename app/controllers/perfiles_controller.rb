class PerfilesController < ApplicationController

  before_action :confirm_logged_in
  
  def index
    @perfiles = Perfil.all.paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @perfil = Perfil.new
  end
  
  def create
    @perfil = Perfil.new(perfil_params)
    if @perfil.save
	  flash[:success] = "Registro guardado!"
      redirect_to perfiles_path
    else
      render 'new'
    end
	
  end
  
  def show
    @perfil = Perfil.find(params[:id])
  end
  
  def edit
    @perfil = Perfil.find(params[:id])
  end
  
  def update
    @perfil = Perfil.find(params[:id])
   
    if @perfil.update(perfil_params)
	  flash[:success] = "Registro editado!"
      redirect_to(:action => 'index')
    else
      render 'edit'
    end
	
  end

  def destroy
    @perfil = Perfil.find(params[:id])
    @perfil.destroy
    flash[:success] = "Registro eliminado"
    redirect_to perfiles_path
  end
  
  private
  def perfil_params
    params.require(:perfil).permit(:nombre, :desc)
  end
end

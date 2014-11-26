class TiposController < ApplicationController
  
  before_action :confirm_logged_in
  
  def index
    @tipos = Tipo.all.paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @tipo = Tipo.new
  end
  
  def create
    @tipo = Tipo.new(tipo_params)
    if @tipo.save
	  flash[:success] = "Registro guardado!"
      redirect_to @tipo
	else
	  render 'new'
	end
  end
  
  def show
    @tipo = Tipo.find(params[:id])
  end
  
  def edit
    @tipo = Tipo.find(params[:id])
  end
  
  def update
    @tipo = Tipo.find(params[:id])
   
    if @tipo.update(tipo_params)
	  flash[:success] = "Registro editado!"
      redirect_to @tipo
    else
      render 'edit'
    end
  end

  def destroy
    @tipo = Tipo.find(params[:id])
    @tipo.destroy
    flash[:success] = "Registro eliminado"
    redirect_to tipos_path
  end

  private
  def tipo_params
    params.require(:tipo).permit(:nombre, :desc)
  end
end

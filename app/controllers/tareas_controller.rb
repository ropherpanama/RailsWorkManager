class TareasController < ApplicationController
  
  before_action :confirm_logged_in
  
  def new
    @tipos = Tipo.all
    @tarea = Tarea.new
  end

  def create
	@tarea = Tarea.new(tarea_params)
    @usuario = Usuario.find(session[:user_id])
    @tipo = Tipo.find(params[:tipo_id])
    @tarea.usuario = @usuario # Just set the reference!
    @tarea.tipo = @tipo # Just set the reference!
	
	if @tarea.save
	  flash[:success] = "Registro guardado!"
      redirect_to @tarea
    else
	  @tipos = Tipo.all
      render 'new'
    end
  end

  def edit
    @tarea = Tarea.find(params[:id])
	@tipos = Tipo.all
  end

  def update
    @tarea = Tarea.find(params[:id])
	@tipo = Tipo.find(params[:tipo_id])
	@tarea.tipo = @tipo
	
    if @tarea.update(tarea_params)
	  flash[:success] = "Registro editado!"
      redirect_to @tarea
    else
      render 'edit'
    end
  end

  def show
    @tarea = Tarea.find(params[:id])
  end

  def index
    #@tareas = Tarea.all
	#Se retornan las tareas del usuario en sesion en orden descendente
	@tareas = Usuario.find(session[:user_id]).tareas.order(fecha: :desc).paginate(page: params[:page], per_page: 10) # tareas del usuario logueado
  end
  
  def destroy
    @tarea = Tarea.find(params[:id])
    @tarea.destroy
    flash[:success] = "Registro eliminado"
    redirect_to tareas_path
  end
  
  def find_by_date
	@tareas = Tarea.where('titulo like :search', {:search => "%#{params[:search]}%"}).paginate(page: params[:page], per_page: 10)
	render 'index'
  end
  
  def repetir_tarea
    tarea = Tarea.find(params[:id])
	@r = Tarea.new
	@r.titulo = tarea.titulo
	@r.desc = tarea.desc
	@r.horas = tarea.horas
	@r.tipo_id = tarea.tipo.id
	@r.usuario_id = tarea.usuario.id
	@r.fecha = Time.now
	
	if @r.save
	  flash[:success] = "Se ingreso la tarea correctamente"
	  redirect_to @r
	else
	  flash[:danger] = "No se pudo repetir la tarea"
	  render 'index'
	end
	
  end
  
  private
  def tarea_params
    params.require(:tarea).permit(:titulo, :desc, :horas, :fecha, :tipo_id, :user_id)
  end
end

Rails.application.routes.draw do
  # raiz del site localhost:3000
  root 'access#login' 
  get 'login', :to => 'access#login' 
  get 'sign_up', :to => 'access#sign_up'
  # url para la accion logout  
  get 'logout', :to => 'access#logout' 
  # url para la accion index
  
  get 'find_by_date', :to => 'tareas#find_by_date'
  get 'index', :to => 'access#index'
  # url para la accion de validacion de contraseña
  post 'attempt_login', :to => 'access#attempt_login' 
  get 'repetir_tarea', :to => 'tareas#repetir_tarea'
  # declaracion de routes REST para los recursos 
  resources :tipos, :perfiles, :usuarios, :tareas
  
  #resources :perfiles do
  #  resources :usuarios
  #end
  #
  #resources :tipos do
  #  resources :tareas
  #end
 
end

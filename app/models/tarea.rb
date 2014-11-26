class Tarea < ActiveRecord::Base
  belongs_to :tipo
  belongs_to :usuario
  
  validates :titulo, presence: true
  validates :desc, presence: true
  validates :horas, presence: true
  validates :fecha, presence: true

end

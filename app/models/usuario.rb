class Usuario < ActiveRecord::Base

  has_secure_password
  belongs_to :perfil
  has_many :tareas, dependent: :destroy
  
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :nickname, presence: true
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true, length: { minimum: 8 }
  
end

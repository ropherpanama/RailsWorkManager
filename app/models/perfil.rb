class Perfil < ActiveRecord::Base
  # Con dependent: al eliminar un registro de perfiles se eliminaran todos
  # los usuarios bajo ese perfil
  has_many :usuarios, dependent: :destroy
  
  validates :nombre, presence: true, length: { minimum: 3 }
  validates :desc, presence: true
end

class Tipo < ActiveRecord::Base
  has_many :tareas, dependent: :destroy
  validates :nombre, presence: true, length: { minimum: 3 }
  validates :desc, presence: true
end

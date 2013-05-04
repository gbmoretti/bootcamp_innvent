class Colaborador < ActiveRecord::Base
  validates_presence_of :nome, :matricula, :cargo

end

class Projeto < ActiveRecord::Base
  has_many :tarefas
  validates_presence_of :nome, :message => 'deve ser preenchido'
  validates_size_of :nome, :minimum => 3
  validates_presence_of :data_inicio
  validate :letra_maiuscula_projeto, :data_inicial_passado
  
  
  
  private 
    def letra_maiuscula_projeto
      errors.add(:nome, "Primeira letra do nome deve ser maiuscula") unless nome =~ /^[A-Z]/
    end
  
    def data_inicial_passado
      errors.add(:data_inicio, "Data inicial nao pode ser menor que a atual") unless data_inicio >= Date.today
    end
  
end

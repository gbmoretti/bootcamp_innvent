class Tarefa < ActiveRecord::Base
  belongs_to :projeto
  
  validates_presence_of :descricao, {:message => "Deve ser preenchido"}
  validates :projeto, :presence => {:message => "Deve ser preenchido"}
  validates_size_of :descricao, :minimum => 3
  
  scope :do_projeto, lambda{|projeto_id| Tarefa.where(:projeto_id => projeto_id)}
  
  def concluir!
    self.data_finalizacao = Date.today
    self.save
  end
  
  def concluida?
    !self.data_finalizacao.nil?
  end
  
end

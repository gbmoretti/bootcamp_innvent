class VinculaTarefaColaborador < ActiveRecord::Migration
  def up
    add_column :tarefas, :colaborador_id, :integer
  end

  def down
    remove_column :tarefas, :colaborador_id
  end
end

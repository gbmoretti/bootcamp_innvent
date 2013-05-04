require 'sqlite3'

class Metricas 

  def initialize(file)
    connect(file)
  end

  def connect(file)
    # Open a SQLite 3 database file
    @db = SQLite3::Database.new file
  end

  def tarefas_por_colaborador
    colaboradores = get_colaboradores
    
    print "Quantidade de tarefas por colaboradores\n"
    print "Colaborador\tQtd. tarefas\n"
    colaboradores.each do |c|
      #pega todas as tarefas do colaborado c
      quantidade = @db.get_first_row "SELECT COUNT(*) FROM tarefas WHERE colaborador_id = #{c[:id]}"
      print "#{c[:nome]} \t #{quantidade[0]}\n"
    end    
  end

  def tempo_medio_por_colaborador
    colaboradores = get_colaboradores
    
    print "Tempo-medio de conclusao de tarefas por colaborador\n"
    print "Colaborador\tTempo-medio\n"
    
    colaboradores.each do |c|
      tarefas = Array.new
      @db.execute "SELECT data_finalizacao, created_at FROM tarefas WHERE colaborador_id = #{c[:id]}" do |t|
        if t[0].nil?
          tarefas.push({:finalizacao => nil, :criacao => t[1]})
        else
          tarefas.push({:finalizacao => Date.strptime(t[0],'%Y-%m-%d'), :criacao => Date.strptime(t[1],'%Y-%m-%d %H:%M:%S')})
        end
      end
      soma_tempo = 0
      qtd_tarefas = 0
      tarefas.each do |t|
        unless t[:finalizacao].nil?
          soma_tempo += (t[:finalizacao] - t[:criacao]).to_i 
          qtd_tarefas += 1
        end
      end
      
      media = soma_tempo / qtd_tarefas
      print "#{c[:nome]} \t #{media} dias\n"
    end
      
  end
  
  def tempo_por_projeto
    projetos = get_projetos
    print "Tempo-medio de conclusao de tarefas por colaborador\n"
    print "Projeto\tTempo total\n"
    
    projetos.each do |p|
      tarefas = Array.new
      @db.execute "SELECT data_finalizacao, created_at FROM tarefas WHERE projeto_id = #{p[:id]}" do |t|
        if t[0].nil?
          tarefas.push({:finalizacao => nil, :criacao => t[1]})
        else
          tarefas.push({:finalizacao => Date.strptime(t[0],'%Y-%m-%d'), :criacao => Date.strptime(t[1],'%Y-%m-%d %H:%M:%S')})
        end
      end
      soma_tempo = 0
      tarefas.each do |t|
        unless t[:finalizacao].nil?
          soma_tempo += (t[:finalizacao] - t[:criacao]).to_i 
        end
      end
      print "#{p[:nome]} \t #{soma_tempo} dias\n"
    end
  end

  #retorna hash com campos nome e id do colaborador
  def get_colaboradores
    #pega todos os id's dos colaboradores
    colaborador = Array.new
    @db.execute 'SELECT id, nome FROM colaboradors' do |c|
      colaborador.push({:nome => c[1], :id => c[0] })
    end
    colaborador
  end 
  
  def get_projetos
    #pega todos os id's dos projetos
    projeto = Array.new
    @db.execute 'SELECT id, nome FROM projetos' do |c|
      projeto.push({:nome => c[1], :id => c[0] })
    end
    projeto
  end

end

opcao = ARGV[0]
app = Metricas.new('2do.sqlite3')

case opcao
  when "colaborador"
    app.tarefas_por_colaborador
    
  when "tempo-medio"
    app.tempo_medio_por_colaborador
    
  when "projeto"
    app.tempo_por_projeto
  
  else 
    puts "colaborador: exibir a quantidade de tarefas por colaborador"
    puts "tempo-medio: exibir o tempo-medio de conclusao de tarefas por um colaborador"
    puts "projeto: exibir o tempo total gasto em tarefas por projeto"
end





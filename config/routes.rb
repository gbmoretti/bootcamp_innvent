Todo::Application.routes.draw do
  resources :colaboradors

  resources :projetos do
    resources :tarefas, :except => [:show] do
      get 'concluir'
    end
  end

  root :to => 'projetos#index'
end

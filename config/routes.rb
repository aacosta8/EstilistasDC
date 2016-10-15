Rails.application.routes.draw do
  
  root 'welcome#index'
  get '/main'  => 'welcome#main'
  get '/sobreNosotros'  => 'welcome#sobreNosotros'
  get '/testimonios'  => 'welcome#testimonios'
  get '/contact'  => 'welcome#contact'
  get '/noticias'  => 'welcome#noticias'
  get '/login'  => 'welcome#login'
  get '/registro'  => 'welcome#registro'

  get '/entrar'  => 'clientes#index_clientes'
  get '/mainC'  => 'clientes#mainC'
  get '/perfil' => 'clientes#perfil'
  get '/misCitas' => 'clientes#misCitas'
  get '/puntosCercanos' => 'clientes#puntosCercanos'
  get '/estilistas' => 'clientes#estilistas'
  get '/experiencias' => 'clientes#experiencias'

  get 'estilistas/inicioest' => 'estilistas#inicioest#perfilest'
  get 'estilistas/perfilest' => 'estilistas#perfilest'
  get 'estilistas/cortesest' => 'estilistas#cortesest'
  get 'estilistas/citaspest' => 'estilistas#citaspest'
  get 'estilistas/agendaest' => 'estilistas#agendaest'
  get 'estilistas/pubexpest' => 'estilistas#pubexpest'
  get 'estilistas/verexpest' => 'estilistas#verexpest'

  post '/entrar' => 'welcome#entrar'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

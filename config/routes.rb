Rails.application.routes.draw do
  
  root to:'welcome#main'
  get '/main'  => 'welcome#main'
  get '/sobreNosotros'  => 'welcome#sobreNosotros'
  get '/testimonios'  => 'welcome#testimonios'
  get '/contact'  => 'welcome#contact'
  get '/noticias'  => 'welcome#noticias'
  get '/login'  => 'welcome#login'
  get '/registro'  => 'welcome#registro'

  get '/mainC'  => 'clientes#mainC'
  get '/perfil' => 'clientes#perfil'
  get '/misCitas' => 'clientes#misCitas'
  get '/puntosCercanos' => 'clientes#puntosCercanos'
  get '/estilistas' => 'clientes#estilistas'
  get '/experiencias' => 'clientes#experiencias'

  get '/mainest' => 'estilistas#mainest'
  get '/perfilest' => 'estilistas#perfilest'
  get '/cortesest' => 'estilistas#cortesest'
  get '/citaspest' => 'estilistas#citaspest'
  get '/agendaest' => 'estilistas#agendaest'
  get '/pubexpest' => 'estilistas#pubexpest'
  get '/verexpest' => 'estilistas#verexpest'

  post '/entrar' => 'welcome#entrar'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

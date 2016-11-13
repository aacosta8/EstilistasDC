Rails.application.routes.draw do

  root to:'welcome#main'

  get '/main'  => 'welcome#main'
  get '/sobreNosotros'  => 'welcome#sobreNosotros'
  get '/testimonios'  => 'welcome#testimonios'
  get '/contact'  => 'welcome#contact'
  get '/noticias'  => 'welcome#noticias'
  get '/login'  => 'welcome#login'
  get '/registro'  => 'welcome#registro'
  get '/regcliente' => 'welcome#regcliente'
  get '/regestilista' => 'welcome#regestilista'

  get '/mainC'  => 'clientes#mainC'
  get '/perfil' => 'clientes#perfil'
  patch '/perfil' => 'clientes#editarcliente'

  get '/misCitas' => 'clientes#misCitas'
  get '/listaCitas' => 'clientes#listaCitas'
  get 'citasProgramadas' => 'clientes#citasProgramadas'
  get '/puntosCercanos' => 'clientes#puntosCercanos'
  get '/estilistas' => 'clientes#estilistas'
  get '/experiencias' => 'clientes#experiencias'
  post '/experiencias' => 'clientes#nuevaexperiencia'

  get '/mainest' => 'estilistas#mainest'
  get '/perfilest' => 'estilistas#perfilest'
  post '/perfilest/editar' => 'estilistas#editarestilista'

  get '/cortesest' => 'estilistas#cortesest'
  post '/cortesest' => 'estilistas#agregarcorte'

  get '/citaspest' => 'estilistas#citaspest'

  get '/agendaest' => 'estilistas#agendaest'
  post '/agendaest/guardar' => 'estilistas#agendaestnew'
  get '/horarios' => 'estilistas#horarios'

  get '/verexpest' => 'estilistas#verexpest'
  post '/verexpest' => 'estilistas#nuevaverexpest'

  post '/entrar' => 'welcome#entrar'

  post '/registrarme' => 'welcome#registrarme'
  post '/regclientes' => 'welcome#regclientes'
  post '/regestilistas' => 'welcome#regestilistas'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

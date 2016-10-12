Rails.application.routes.draw do
  root 'welcome#index#main'
  get '/main'  => 'welcome#main'
  get '/sobreNosotros'  => 'welcome#sobreNosotros'
  get '/testimonios'  => 'welcome#testimonios'
  get '/contact'  => 'welcome#contact'
  get '/noticias'  => 'welcome#noticias'
  get '/login'  => 'welcome#login'
  get '/registro'  => 'welcome#registro'
  post '/entrar' => 'welcome#entrar'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

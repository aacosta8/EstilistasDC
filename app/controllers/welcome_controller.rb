class WelcomeController < ApplicationController
  def index
  	# @Holamundo = "Hola Estilistas"
  end
  def main
  end
  def contact
  end
  def login
  end
  def noticias
  end
  def registro
  end
  def sobreNosotros
  end
  def testimonios
  end
  def entrar
  	parametros_seguros = entrar_params
  	correo = parametros_seguros[:correo]
    clave = parametros_seguros[:clave]
    estilista = Stylist.find_by(correo_electronico: correo)
    # cliente = Customer.find_by(correo_electronico: correo)
    if estilista
     # render plain: "Hola"
     redirect_to controller: 'estilistas', action: 'mainest'
   else
     redirect_to controller: 'clientes', action: 'mainC'
     #render plain: "No"
   end
 end
 def registrar
  render plain: "Clic en registrar"
 #  	#Despues de lo explicado para entrar
 #  	persona = Persona.new
 #  	persona.nombre = nombre;
 #  	#.
 #  	#.
 #  	#.
 #  	unless persona.save
 #  		aler
	# end
end

private
def entrar_params
 params.permit(:correo,:clave)
end
end

class WelcomeController < ApplicationController
  def index
  	@Holamundo = "Hola Estilistas"
  end
  def main
  end
  def entrar
  	parametros_seguros = entrar_params
  	correo = parametros_seguros[:correo]
    clave = parametros_seguros[:clave]
    usuario = Stylist.find_by(correo_electronico: correo)
    if usuario
     render plain: "Hola"
   else
     render plain: "No"
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

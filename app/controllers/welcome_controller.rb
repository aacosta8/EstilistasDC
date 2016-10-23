class WelcomeController < ApplicationController

  def index
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
    cedula = parametros_seguros[:cedula]
    nombre = parametros_seguros[:nombre]

    if persona = Person.find_by(cedula: cedula)

      if persona.tipo == "Cliente" and persona.nombre == nombre
       redirect_to controller: 'clientes', action: 'mainC'

     else




     end


     if persona.tipo == "Estilista" and persona.nombre == nombre
       redirect_to controller: 'clientes', action: 'mainC'

     else

     end
   else
    flash[:notice] = "Campos vacíos"
  end
end

def registrarme
end


def regclientes

  person = Person.new
  datos = regcliente_params

  person.nombre = datos[:nombre]
  person.apellido = datos[:apellido]
  person.cedula = datos[:cedula]
  person.fecha_nacimiento = datos[:nacimiento]
  person.genero = datos[:genero]
  person.telefono_movil = datos[:movil]
  person.telefono_fijo = datos[:fijo]
  person.tipo = "Cliente"
  person.ubication_id = 1

  person.save

  cliente = Customer.new
  cliente.person_id = person.id
  cliente.tipo_discapacidad =datos[:tipo] 

  cliente.save
end


private

def entrar_params
 params.permit(:cedula,:nombre)
end

def regcliente_params
 params.permit(:nombre, :apellido, :cedula, :nacimiento, :genero, :movil, :fijo, :tipo)
end
end


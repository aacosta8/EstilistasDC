
class WelcomeController < ApplicationController

  def index
  end

  def main
    session.delete(:persona_id)
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

    if persona = Person.find_by(cedula: cedula) and persona.tipo == "Cliente" and persona.nombre == nombre
      session[:persona_id] = persona.id
      redirect_to controller: 'clientes', action: 'mainC'
    elsif persona = Person.find_by(cedula: cedula) and persona.tipo == "Estilista" and persona.nombre == nombre
      session[:persona_id] = persona.id
      redirect_to controller: 'estilistas', action: 'mainest'
    else 
      flash[:notice] = "Datos incorrectos"
      redirect_to login_path
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

    if cliente.save
      flash[:notice] = "Su registro ha sido exitoso"
      redirect_to regcliente_path
    end
  
  end

  def regestilistas

    person = Person.new
    datos = regestilista_params

    person.nombre = datos[:nombre]
    person.apellido = datos[:apellido]
    person.cedula = datos[:cedula]
    person.fecha_nacimiento = datos[:nacimiento]
    person.genero = datos[:genero]
    person.telefono_movil = datos[:movil]
    person.telefono_fijo = datos[:fijo]
    person.tipo = "Estilista"
    person.ubication_id = 1

    person.save

    estilista = Stylist.new
    estilista.person_id = person.id
    estilista.especialidad = datos[:especialidad]
    estilista.correo_electronico = datos[:correo] 

    if estilista.save
      flash[:notice] = "Su registro ha sido exitoso"
      redirect_to regestilista_path
    end
  end


  private

  def entrar_params
   params.permit(:cedula,:nombre)
 end

 def regcliente_params
   params.permit(:nombre, :apellido, :cedula, :nacimiento, :genero, :movil, :fijo, :tipo)
 end

 def regestilista_params
   params.permit(:nombre, :apellido, :cedula, :especialidad, :nacimiento, :genero, :movil, :fijo, :tipo, :correo)
 end
end


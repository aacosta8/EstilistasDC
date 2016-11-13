class ClientesController < ApplicationController
  def mainC
    if autorizado("Cliente")
    end

    id_cliente = session[:persona_id]

    persona = Person.find_by(id: id_cliente)
    @nombre = persona.nombre
  end

  def perfil
    if autorizado("Cliente")
    end 
    id_cliente = session[:persona_id]
    @persona = Person.find_by(id: id_cliente)
    @cliente = Customer.find_by(person_id: id_cliente)
    @ubicacion = Ubication.find_by(id: @persona.ubication_id)
  end

  def editarcliente
    if autorizado("Cliente")
    end

    datos = updatecliente_params


    id_cliente = session[:persona_id]

    persona = Person.find_by(id: id_cliente) 
    persona.nombre = datos[:nombre]
    persona.apellido = datos[:apellido]
    persona.fecha_nacimiento = datos[:fecha_nacimiento]
    persona.telefono_movil = datos[:telefono_movil]
    persona.telefono_fijo = datos[:telefono_fijo]
    persona.foto_perfil = datos[:foto_perfil]

    cliente = Customer.find_by(person_id: id_cliente)
    cliente.tipo_discapacidad = updatecliented_params[:tipo_discapacidad]

    ubicacion = Ubication.new
    ubicacion.direccion = updateclienteu_params[:barrio]
    ubicacion.barrio = updateclienteu_params[:direccion]

    if persona.save and cliente.save and ubicacion.save
      redirect_to perfil_path
    end

  end

  def nuevaexperiencia
    if autorizado("Cliente")
    end
    experiencia = Experience.new nuevaexperiencia_params
    experiencia.person_id = session[:persona_id]

    if experiencia.save
      redirect_to experiencias_path
    end
  end

  def misCitas
    if autorizado("Cliente")
    end
  end
  def listaCitas
    if autorizado("Cliente")
    end
    @schedules = Schedule.all.order("created_at ASC")
  end
  def puntosCercanos
    if autorizado("Cliente")
    end
  end
  def estilistas
    if autorizado("Cliente")
    end
  end
  def experiencias
    if autorizado("Cliente")
    end
    @experience = Experience.new
  end
  def citasProgramadas
    if autorizado("Cliente")
    end
    @schedules = Schedule.all.order("created_at ASC")
  end

  private

  def updatecliente_params
    params.require(:person).permit(:nombre, :apellido, :fecha_nacimiento, :telefono_movil, :telefono_fijo, :foto_perfil)
  end

  def updatecliented_params
    params.require(:customer).permit(:tipo_discapacidad)
  end

  def updateclienteu_params
    params.require(:ubication).permit(:barrio, :direccion)
  end

  def nuevaexperiencia_params
    params.require(:experience).permit(:comentario,:foto_exp)
  end
end
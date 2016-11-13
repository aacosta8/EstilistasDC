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
    
    persona = Person.find_by(id: id_cliente)
    @nombre = persona.nombre
    @apellido = persona.apellido
    @fecha_nacimiento = persona.fecha_nacimiento
    @telefono_fijo = persona.telefono_fijo
    @telefono_movil = persona.telefono_movil

    ubicacion = Ubication.find_by(id: persona.id)
    @direccion = ubicacion.direccion
    @barrio = ubicacion.barrio

    cliente = Customer.find_by(person_id: id_cliente)
    @tipo_discapacidad = cliente.tipo_discapacidad

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

    cliente = Customer.find_by(person_id: id_cliente)
    cliente.tipo_discapacidad = datos[:tipo_discapacidad]

    ubicacion = Ubication.new
    ubicacion.direccion = datos[:direccion]
    ubicacion.barrio = datos[:barrio]

    persona.save
    cliente.save
    ubicacion.save

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
    params.permit(:nombre, :apellido, :fecha_nacimiento, :telefono_movil, :telefono_fijo, :tipo_discapacidad, :direccion, :barrio)
  end

  def nuevaexperiencia_params
    params.require(:experience).permit(:comentario,:foto_exp)
  end
end
class ClientesController < ApplicationController
  def mainC
    id_cliente = session[:persona_id]
  end

  def perfil

  end

  def editarcliente

    datos = updatecliente_params


    id_cliente = session[:persona_id]

    ubicacion = Ubication.new
    ubicacion.direccion = updateclienteu_params[:direccion]
    ubicacion.barrio = updateclienteu_params[:barrio]

    if ubicacion.save
      persona = Person.find_by(id: id_cliente) 
      persona.nombre = datos[:nombre]
      persona.apellido = datos[:apellido]
      persona.fecha_nacimiento = datos[:fecha_nacimiento]
      persona.telefono_movil = datos[:telefono_movil]
      persona.telefono_fijo = datos[:telefono_fijo]
      persona.foto_perfil = datos[:foto_perfil]
      persona.ubication_id = ubicacion.id

      cliente = Customer.find_by(person_id: id_cliente)
      cliente.tipo_discapacidad = updatecliented_params[:tipo_discapacidad]

      if cliente.save and persona.save
        redirect_to perfil_path
      end
    end
  end

  def nuevaexperiencia
    experiencia = Experience.new nuevaexperiencia_params
    experiencia.person_id = session[:persona_id]

    if experiencia.save
      redirect_to experiencias_path
    end
  end

  def misCitas
  end

  def listaCitas
    datos = pedircita_params

    @schedules = Schedule.where( fecha: datos[:fecha] , hora_inicio: datos[:hora])

    if @schedules.none?
     @schedules = Schedule.where( fecha: datos[:fecha] )
   end
 end

 def crearcita
  id_cliente = session[:persona_id]

  schedule = Schedule.find_by(id: pedircitac_params[:id])

  cita = Appointment.new
  cita.fecha = schedule.fecha
  cita.hora_inicio = schedule.hora_inicio
  cita.estado = 0
  cita.customer_id = Customer.find_by(person_id: id_cliente).id
  cita.stylist_id = pedircitac_params[:estilista_id]
  cita.save
  
end



def puntosCercanos
end

def estilistas
end

def experiencias
  @experience = Experience.new
end

def citasProgramadas
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

def pedircita_params
  params.permit(:fecha,:hora)
end

def pedircitac_params
  params.permit(:id, :estilista_id)
end
end
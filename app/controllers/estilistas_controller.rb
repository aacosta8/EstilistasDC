class EstilistasController < ApplicationController

  def mainest
    if autorizado("Estilista")
    end
    id_estilista = session[:persona_id]

    persona = Person.find_by(id: id_estilista)

    @nombre = persona.nombre
  end
  def agendaest
    if autorizado("Estilista")
    end
  end
  def agendaestnew
    if autorizado("Estilista")
    end
    datos = params.permit(:fecha,:horain,:horafin,:lapso)

    inicial= datos[:horain].to_time.hour* 60 + datos[:horain].to_time.min
    final= datos[:horafin].to_time.hour* 60 + datos[:horafin].to_time.min
    lapso= datos[:lapso].to_time.hour* 60 + datos[:lapso].to_time.min


    puts inicial
    puts final
    puts lapso

    var = (final - inicial) / lapso

    horainicio = inicial
    id_est = session[:persona_id]
    
    estilista = Stylist.find_by(person_id: id_est)

    for i in 0..var-1
     horario = Schedule.new

     horario.fecha = datos[:fecha]
     horario.hora_inicio = ((inicial/60).to_s + ":" + (inicial%60).to_s ).to_time
     inicial+= lapso
     horario.hora_fin = ((inicial/60).to_s + ":" + (inicial%60).to_s ).to_time
     horario.stylist_id = estilista.id

     horario.save
   end

 end
 def citaspest
  if autorizado("Estilista")
  end 
end
def cortesest
  if autorizado("Estilista")
  end
end
def perfilest
  if autorizado("Estilista")
  end

  id_estilista = session[:persona_id]

  persona = Person.find_by(id: id_estilista)

  @nombre = persona.nombre
  @apellido = persona.apellido
  @fecha_nacimiento = persona.fecha_nacimiento
  @telefono_fijo = persona.telefono_fijo
  @telefono_movil = persona.telefono_movil

  estilista = Stylist.find_by(person_id: id_estilista)
  @correo_electronico = estilista.correo_electronico
end

def editarestilista
  if autorizado("Estilista")
  end

  datos = updateestilista_params

  id_estilista = session[:persona_id]

  persona = Person.find_by(id: id_estilista)

  persona.nombre = datos[:nombre]
  persona.apellido = datos[:apellido]
  persona.fecha_nacimiento = datos[:fecha_nacimiento]
  persona.telefono_movil = datos[:telefono_movil]
  persona.telefono_fijo = datos[:telefono_fijo]

  estilista = Stylist.find_by(person_id: id_estilista)

  estilista.correo_electronico = datos[:correo_electronico]

  persona.save
  estilista.save

end 

def pubexpest
end
def verexpest
  if autorizado("Estilista")
  end
end

private

def updateestilista_params
  params.permit(:nombre, :apellido, :fecha_nacimiento, :telefono_movil, :telefono_fijo, :correo_electronico)
end
end

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
  @haircut = Haircut.new
end

def agregarcorte
  if autorizado("Estilista")
  end
  corte = Haircut.new agregarcorte_params

    if corte.save
      id_estilista = session[:persona_id]
      estilista = Stylist.find_by(person_id: id_estilista)
      corte = Haircut.find_by(id: corte.id)
      cortest = HaircutStylist.new
      cortest.stylist_id = estilista.id
      cortest.haircut_id = corte.id
      cortest.save
      redirect_to cortesest_path
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

  def verexpest
    if autorizado("Estilista")
    end

    @experience = Experience.new

  end

  def nuevaverexpest
    if autorizado("Estilista")
    end

    experiencia = Experience.new nuevaexperiencia_params
    experiencia.person_id = session[:persona_id]

    if experiencia.save
      redirect_to verexpest_path
    end

  end

  def horarios
    if autorizado("Estilista")
    end
    @schedules = Schedule.all.order("created_at ASC")
  end

  private

  def updateestilista_params
    params.permit(:nombre, :apellido, :fecha_nacimiento, :telefono_movil, :telefono_fijo, :correo_electronico)
  end

  def nuevaexperiencia_params
    params.require(:experience).permit(:comentario,:foto_exp)
  end

  def agregarcorte_params
    params.require(:haircut).permit(:nombre_corte,:descripcion,:foto)
  end
end

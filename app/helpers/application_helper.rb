module ApplicationHelper
	def autorizado(tipo_usuario_autorizado)
		if persona = Person.find_by(id: session[:persona_id])
			if persona.tipo == tipo_usuario_autorizado
				return true
			end
			#"aqui va lo del mensaje sobre que no es usuario autorizado"
			
		else
			#Mensaje no ha iniciado sesion

		end
		redirect_to root_url
	end
end

class EstilistasController < ApplicationController
  def inicioest
  	@Holamundo = "Hola Estilistas"
  end
  def perfilest
  	redirect_to :back
  	redirect_to "/perfilest"
  end
end

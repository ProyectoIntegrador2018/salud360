class NutriologoPagesController < ApplicationController
  def metas_paciente
    @paciente = params[:id]
    @metas = paciente_metas(@paciente)
    @comentarios = paciente_tips(@paciente)
  end

  def metas_cita
    @cita = params[:id]
    @metas = cita_metas(@cita)

  end

  def sesiones_paciente
    @paciente = params[:id]
    @sesions = paciente_sesions(@paciente)
  end

  def dietas_paciente
    @paciente=params[:id]
    @dietas = paciente_dietas(@paciente)
  end
end

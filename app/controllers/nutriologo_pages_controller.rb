class NutriologoPagesController < ApplicationController
  def metas_paciente
    @paciente = params[:id]
    @metas = paciente_metas(@paciente)
  end

  def metas_cita
    @cita = params[:id]
    @metas = cita_metas(@cita)
  end

  def sesiones_paciente
    @paciente = params[:id]
    @sesions = paciente_sesions(@paciente)
  end
end

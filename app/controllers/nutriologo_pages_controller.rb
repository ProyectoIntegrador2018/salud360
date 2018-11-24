class NutriologoPagesController < ApplicationController
  def metas_paciente
    @paciente = params[:id]
    @metas = paciente_metas(@paciente)
    @porcentaje = 0
    if @metas.count >0
      @porcentaje = (@metas.where(cumplida: true).count*1.0/(@metas.count*1.0)*100).to_i()
    end
    @comentarios = paciente_tips(@paciente)
  end

  def metas_cita
    @cita = params[:id]
    @metas = cita_metas(@cita)
    @porcentaje = 0
    if @metas.count >0
      @porcentaje = (@metas.where(cumplida: true).count*1.0/(@metas.count*1.0)*100).to_i()
    end

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

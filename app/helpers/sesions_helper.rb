module SesionsHelper

  def current_paciente_sesions
    @current_paciente_sesions ||=
      Sesion.where(paciente_id: current_paciente.id).all
  end

  def current_nutriologo_sesions
    @current_nutriologo_sesions ||=
      Sesion.where(nutriologo_id: current_nutriologo.id).all
  end

  def paciente_metas(paciente_id)
    @paciente_metas ||=
      Meta.where(paciente_id: paciente_id).all
  end

  def cita_metas(cita_id)
    @cita_metas ||=
      Meta.where(sesions_id: cita_id).all
  end

  def paciente_sesions(paciente_id)
    @paciente_sesions ||=
      Sesion.where(paciente_id: paciente_id).all
  end

  def current_pacientes_nutriologo
    @current_pacientes_nutriologo ||= Sesion.where(nutriologo_id: current_nutriologo.id).select(:paciente_id).distinct
  end





end

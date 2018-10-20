module SesionsHelper

  def current_paciente_sesions
    @current_paciente_sesions ||=
      Sesion.where(paciente_id: current_paciente.id).all
  end

  def current_nutriologo_sesions
    @current_nutriologo_sesions ||=
      Sesion.where(nutriologo_id: current_nutriologo.id).all
  end
end

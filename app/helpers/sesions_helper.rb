module SesionsHelper

  def current_paciente_sesions
    @current_paciente_sesions ||=
      Sesion.find_by(paciente_id: current_paciente.id)
  end
end

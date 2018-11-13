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


  def paciente_metas(paciente_id)
    @paciente_metas ||=
      TipsYcomentario.where(paciente_id: paciente_id).all
  end

  def nutriologo_metas(nutriologo_id)
    @nutriologo_metas ||=
      TipsYcomentario.where(nutriologo_id: nutriologo_id).all
  end

  def current_paciente_pesos
    pesos = []
    current_paciente_sesions.each_with_index do |sesion, index|
      pesos_index = []
      pesos_index.push("Sesion#{index+1}", sesion.peso)
      pesos.push(pesos_index)
    end
    @current_paciente_pesos ||= pesos
  end

  def current_paciente_grasa
    grasa = []
    current_paciente_sesions.each_with_index do |sesion, index|
      grasa_index = []
      grasa_index.push("Sesion#{index+1}", sesion.grasa)
      grasa.push(grasa_index)
    end
    @current_paciente_grasa ||= grasa

  end

  def current_paciente_musculo
    musculo = []
    current_paciente_sesions.each_with_index do |sesion, index|
      musculo_index = []
      musculo_index.push("Sesion#{index+1}", sesion.musculo)
      musculo.push(musculo_index)
    end
    @current_paciente_musculo ||= musculo
  end

end

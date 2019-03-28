module SesionsHelper

  def current_user_sesions
    @current_user_sesions ||=
      paciente_sesions(current_user.id).all
  end

  def current_user_next_sessions
    @current_user_next_sessions ||= current_user_sesions.joins("INNER JOIN horarios ON horarios.id = sesions.hora_id").where( ['horarios.hora_disponible >= ?', DateTime.now.getlocal-0.3.day]).order("horarios.hora_disponible asc").all
  end

  def current_user_sesions
    @current_user_sesions ||=
      Sesion.where(nutriologo_id: current_user.id).joins("INNER JOIN horarios ON horarios.id = sesions.hora_id").where( ['horarios.hora_disponible >= ?', DateTime.now.getlocal-1.day]).order("horarios.hora_disponible asc").all
  end

  def current_user_sesionss
    @current_user_sesionss ||=
      Sesion.where(nutriologo_id: current_user.id).joins("INNER JOIN horarios ON horarios.id = sesions.hora_id").where.not( ['horarios.hora_disponible >= ?', DateTime.now.getlocal-1.day]).order("horarios.hora_disponible desc")
  end

  def paciente_metas(paciente_id)
    @paciente_metas =
      Meta.where(paciente_id: paciente_id).order(cumplida: :asc).all
  end

  def cita_metas(cita_id)
    @cita_metas =
      Meta.where(sesions_id: cita_id).all
  end

  def paciente_sesions(paciente_id)
    @paciente_sesions =
      Sesion.where(paciente_id: paciente_id).order(created_at: :asc).all
  end

  def paciente_dietas(paciente_id)
    @paciente_dietas =
      Dieta.where(paciente_id: paciente_id).all
  end

  def current_users_nutriologo
    nutr_sesions = current_user.sesions
    ids_pacientes = []
    nutr_sesions.each do |sesion|
      ids_pacientes.push(sesion.paciente_id)
    end
    ids_pacientes = ids_pacientes.uniq
    pacientes = []
    ids_pacientes.each do |id|
      pacientes.push(Paciente.find(id))
    end
    @current_users_nutriologo ||= pacientes
  end


  def paciente_tips(paciente_id)
    @paciente_tips =
      TipsYcomentario.where(paciente_id: paciente_id).all
  end

  def nutriologo_tips(nutriologo_id)
    @nutriologo_tips =
      TipsYcomentario.where(nutriologo_id: nutriologo_id).all
  end

  def current_user_pesos
    pesos = []
    current_user_sesions.each_with_index do |sesion, index|
      pesos_index = []
      pesos_index.push("Sesion#{index+1}", sesion.peso)
      pesos.push(pesos_index)
    end
    @current_user_pesos ||= pesos
  end

  def current_user_grasa
    grasa = []
    current_user_sesions.each_with_index do |sesion, index|
      grasa_index = []
      grasa_index.push("Sesion#{index+1}", sesion.grasa)
      grasa.push(grasa_index)
    end
    @current_user_grasa ||= grasa

  end

  def current_user_musculo
    musculo = []
    current_user_sesions.each_with_index do |sesion, index|
      musculo_index = []
      musculo_index.push("Sesion#{index+1}", sesion.musculo)
      musculo.push(musculo_index)
    end
    @current_user_musculo ||= musculo
  end

end

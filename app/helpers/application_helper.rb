module ApplicationHelper
  def horarios_disponibles
    @horarios_disponibles ||=
      Horario.where(apartada: false).all
  end
  def getHora(hora_id)
    if(hora_id==nil)

    else
     @getHora ||=
      Horario.find(hora_id).hora_disponible
    end
  end
  def getNutriologoName(nutriologo_id)
      if(nutriologo_id==nil)
        @getNutriologoName=""
      else
      @getNutriologoName = Nutriologo.find(nutriologo_id).username
      end
  end

  def getPacienteName(paciente_id)
      if(paciente_id==nil)
        @getPacienteName=""
      else
      @getPacienteName = Paciente.find(paciente_id).username
      end
  end

end

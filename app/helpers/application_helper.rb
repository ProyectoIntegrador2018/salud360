module ApplicationHelper
  def horarios_disponibles
    if current_paciente.sesions.size == 0
      @horarios_disponibles ||=
        Horario.where(apartada: false).where( ['hora_disponible >= ?', DateTime.now.getlocal-0.3.day]).all
    else
      @horarios_disponibles ||=
        Horario.where(apartada: false).where( ['hora_disponible >= ?', DateTime.now.getlocal-0.3.day]).where(nutriologo_id: Nutriologo.find_by(id: current_paciente.sesions.first.nutriologo.id)).all
    end
  end
  
  def getHora(hora_id)
    if(hora_id==nil)

    else
     @getHora =
      Horario.find(hora_id).hora_disponible.strftime("%d/%m/%Y a las %r")
    end
  end

  def getDia(hora_id)
    if(hora_id==nil)

    else
     @getDia =
      Horario.find(hora_id).hora_disponible.strftime("%d/%m/%Y")
    end
  end

  def getSede(hora_id)
    if(hora_id==nil)

    else
     @getSede =
      Horario.find(hora_id).sede
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

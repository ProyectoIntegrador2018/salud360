class SesionsController < ApplicationController

  before_action :set_sesion, only: [:edit, :update]

  def edit
    @sesion = Sesion.find(params[:id])
    @paciente = Paciente.find(@sesion.paciente_id)
  end

  def update
    if @sesion.peso != nil && @sesion.estatura != nil && @sesion.grasa != nil && @sesion.musculo != nil && @sesion.imc != nil && @sesion.grasa_vis != nil && @sesion.edad_metabolica != nil
      @sesion.active = false
      @sesion.save!
    end
    respond_to do |format|
      if @sesion.update(sesion_params)
        format.html { render 'nutriologo_pages/mis_sesiones', notice: 'sesion was successfully updated.' }
        format.json { render :show, status: :ok, location: @sesion }
      else
        format.html { render :edit }
        format.json { render json: @sesion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @eliminar = Sesion.find(params[:id])
    Horario.where(id: @eliminar.hora_id).update(apartada: false)
    @eliminar.destroy

    redirect_to pacientes_pages_programarCita_path
  end

  def create


    @sesion= Sesion.new(sesion_params)
    if(@sesion.nutriologo_id==nil && @sesion.hora_id !=nil)
      @sesion.nutriologo_id = Horario.find(@sesion.hora_id).nutriologo_id
    end
    Horario.where(id: @sesion.hora_id).update(apartada: true)
    respond_to do |format|


      if @sesion.save
        format.html { render 'pacientes_pages/programarCita', notice: 'sesion was successfully created.' }
        format.json { render :show, status: :created, location: @sesion }
      else
        format.html { render 'pacientes_pages/programarCita' }
        format.json { render json: @sesion.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sesion
      @sesion = Sesion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sesion_params
      params.require(:sesion).permit(:peso, :estatura, :grasa,
        :musculo, :cintura, :imc, :grasa_vis, :edad_metabolica, :hora_id, :paciente_id)
    end
end

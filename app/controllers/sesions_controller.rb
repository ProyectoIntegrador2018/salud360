class SesionsController < ApplicationController

  before_action :set_sesion, only: [:edit, :update]

  def edit
    @sesion = Sesion.find(params[:id])
  end

  def update
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

<<<<<<< Updated upstream
=======
  def create


    @sesion= Sesion.new(sesion_params)
    @sesion.paciente_id = current_paciente.id
    respond_to do |format|


      if @sesion.save
        format.html { render 'pacientes_pages/mis_sesiones', notice: 'sesion was successfully created.' }
        format.json { render :show, status: :created, location: @sesion }
      else
        format.html { render :new }
        format.json { render json: @sesion.errors, status: :unprocessable_entity }
      end
    end
  end


>>>>>>> Stashed changes
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sesion
      @sesion = Sesion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sesion_params
      params.require(:sesion).permit(:peso, :estatura, :grasa,
        :musculo, :agua, :imc, :grasa_vis, :edad_metabolica, :meta, :hora,
        :fecha, :paciente_id)
    end
end

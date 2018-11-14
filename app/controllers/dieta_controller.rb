class DietaController < ApplicationController
  before_action :set_dieta, only: [:edit, :update]

  def index
    @dietas = Dieta.all
  end

  def edit
    @dieta = Dieta.find(params[:id])
  end

  def update
    respond_to do |format|
      if @dieta.update(dieta_params)
        format.html { render 'paciente_pages/ver_dietas', notice: 'dieta was successfully updated.' }
        format.json { render :show, status: :ok, location: @dieta }
      else
        format.html { render :edit }
        format.json { render json: @dieta.errors, status: :unprocessable_entity }
      end
    end
    @dieta.save!
  end

  def create


    @dieta= Dieta.new(dieta_params)
    respond_to do |format|


      if @dieta.save
        format.html { render 'paciente_dietas/'+@dieta.paciente_id.to_s(), notice: 'dieta was successfully created.' }
        format.json { render :show, status: :created, location: @dieta }
      else
        format.html { render 'paciente_dietas/'+@dieta.paciente_id.to_s() }
        format.json { render json: @dieta.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dieta
      @dieta = Dieta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dieta_params
      params.require(:dieta).permit(:dietaPDF, :nutriologo_id, :paciente_id)
    end
end

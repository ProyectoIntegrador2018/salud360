class TipsYcomentariosController < ApplicationController


  before_action :set_params, only: [:edit, :update]

  def edit
    @tips = TipsYcomentario.find(params[:id])
  end

  def update
    respond_to do |format|
      if @tips.update(tips_params)
        format.html { render 'pacientes_pages/ver_metas', notice: 'tip was successfully updated.' }
        format.json { render :show, status: :ok, location: @tips }
      else
        format.html { render :edit }
        format.json { render json: @tips.errors, status: :unprocessable_entity }
      end
    end
  end

  def create


    @tip= TipsYcomentario.new(tips_params)



      if @tip.save
        redirect_back(fallback_location: '/nutriologo_pages/mis_pacientes')
      else

      end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_params
      @tip = TipsYcomentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tips_params
      params.require(:tips_ycomentario).permit(:tip, :remitente, :nutriologo_id,
        :paciente_id)
    end



end

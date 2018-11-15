class MetaController < ApplicationController

  before_action :set_params, only: [:edit, :update]

  def edit
    @meta = Meta.find(params[:id])
  end

  def update
    @meta.update(meta_params)
          redirect_back(fallback_location: '/nutriologo_pages/mis_pacientes')
  end

  def create


    @meta= Meta.new(meta_params)



      if @meta.save
        redirect_back(fallback_location: '/nutriologo_pages/mis_pacientes')
      else

      end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_params
      @meta = Meta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meta_params
      params.require(:meta).permit(:meta, :cumplida, :sesions_id,
        :paciente_id)
    end



end

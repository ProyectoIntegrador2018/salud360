class MetaController < ApplicationController

  before_action :set_params, only: [:edit, :update]

  def edit
    @meta = Meta.find(params[:id])
  end

  def update
    respond_to do |format|
      if @meta.update(meta_params)
        format.html { render 'pacientes_pages/ver_metas', notice: 'meta was successfully updated.' }
        format.json { render :show, status: :ok, location: @meta }
      else
        format.html { render :edit }
        format.json { render json: @meta.errors, status: :unprocessable_entity }
      end
    end
  end

  def create


    @meta= Meta.new(meta_params)

    respond_to do |format|


      if @meta.save
        format.html { render 'nutriologo_pages/index', notice: 'meta was successfully added.' }
        format.json { render :show, status: :created, location: @meta }
      else
        format.html { render :new }
        format.json { render json: @meta.errors, status: :unprocessable_entity }
      end
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

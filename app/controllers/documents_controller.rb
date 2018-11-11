class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :update]

  def index
    @document = Document.all
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { render 'nutriologo_pages/mis_sesiones', notice: 'sesion was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
    @document.save!
  end

  def create


    @document= Document.new(document_params)
    respond_to do |format|


      if @document.save
        format.html { render 'pacientes_pages/mis_sesiones', notice: 'sesion was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:asset)
    end
end

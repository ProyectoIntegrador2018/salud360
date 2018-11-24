class PacientesPagesController < ApplicationController
  before_action :user_is_paciente
  def user_is_paciente
    unless paciente_signed_in?
      redirect_to root_url
    end
  end
end

class Sesion < ApplicationRecord
  belongs_to :paciente
  belongs_to :nutriologo

  validates :hora_id, uniqueness: true
end

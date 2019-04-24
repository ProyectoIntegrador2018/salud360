class Comment < ApplicationRecord
  belongs_to :paciente
  belongs_to :nutriologo
end

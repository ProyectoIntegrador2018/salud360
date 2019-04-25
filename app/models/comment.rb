class Comment < ApplicationRecord
  belongs_to :paciente, optional: true, :class_name => 'Paciente'
  belongs_to :nutriologo, optional: true, :class_name => 'Nutriologo'
end

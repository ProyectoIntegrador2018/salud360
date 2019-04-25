class Comment < ApplicationRecord
  belongs_to :paciente, optional: true
  belongs_to :nutriologo, optional: true
end

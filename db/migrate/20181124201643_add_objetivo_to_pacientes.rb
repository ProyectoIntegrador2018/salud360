class AddObjetivoToPacientes < ActiveRecord::Migration[5.1]
  def change
    add_column :pacientes, :objetivo, :string, default: "ser más saludable"
  end
end

class AddObjetivoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :objetivo, :string, default: "ser más saludable"
  end
end

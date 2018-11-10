class CreateSesions < ActiveRecord::Migration[5.1]
  def change

    create_table :sesions do |t|

      t.float :peso
      t.float :estatura
      t.float :grasa
      t.float :musculo
      t.float :agua
      t.float :imc
      t.float :grasa_vis
      t.integer :edad_metabolica
      t.integer :hora_id


      t.belongs_to :paciente, index: true
      t.belongs_to :nutriologo, index: true

      t.timestamps
    end
  end
end

class CreateDieta < ActiveRecord::Migration[5.1]
  def change
    create_table :dieta do |t|
      t.string :dietaPDF

      t.belongs_to :nutriologo, index: true
      t.belongs_to :paciente, index: true

      t.timestamps
    end
  end
end

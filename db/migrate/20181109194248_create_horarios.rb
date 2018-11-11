class CreateHorarios < ActiveRecord::Migration[5.1]
  def change
    create_table :horarios do |t|
      t.datetime :hora_disponible
      t.boolean :apartada, default: false
      t.string :sede

      t.belongs_to :nutriologo, index: true
      t.timestamps

    end
  end
end

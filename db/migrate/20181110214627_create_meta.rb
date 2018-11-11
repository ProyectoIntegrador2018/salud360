class CreateMeta < ActiveRecord::Migration[5.1]
  def change
    create_table :meta do |t|
      t.string :meta
      t.boolean :cumplida, default: false

      t.belongs_to :sesions, index: true
      t.belongs_to :paciente, index: true
      
      t.timestamps
    end
  end
end

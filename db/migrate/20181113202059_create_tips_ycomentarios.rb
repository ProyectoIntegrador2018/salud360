class CreateTipsYcomentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :tips_ycomentarios do |t|
      t.string :tip
      t.string :remitente

      t.belongs_to :nutriologo, index: true
      t.belongs_to :paciente, index: true

      t.timestamps
    end
  end
end

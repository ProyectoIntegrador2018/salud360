class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :description
      t.references :paciente, index: true
      t.references :nutriologo, index: true

      t.timestamps
    end
  end
end

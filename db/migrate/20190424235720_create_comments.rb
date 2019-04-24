class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :description
      t.references :paciente, foreign_key: true
      t.references :nutriologo, foreign_key: true

      t.timestamps
    end
  end
end

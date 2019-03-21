class AddPhaseToDocument < ActiveRecord::Migration[5.1]
  def change
    add_column :documents, :phase, :integer, default: 1
  end
end

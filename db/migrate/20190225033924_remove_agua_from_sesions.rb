class RemoveAguaFromSesions < ActiveRecord::Migration[5.1]
  def change
    remove_column :sesions, :agua, :float
  end
end

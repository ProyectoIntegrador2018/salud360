class ChangeAguaToCintura < ActiveRecord::Migration[5.1]
  def change
    rename_column :sesions, :agua, :cintura
  end
end

class AddCinturToSesions < ActiveRecord::Migration[5.1]
  def change
    add_column :sesions, :cintura, :float
  end
end

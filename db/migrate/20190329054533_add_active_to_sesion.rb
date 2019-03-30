class AddActiveToSesion < ActiveRecord::Migration[5.1]
  def change
    add_column :sesions, :active, :boolean, default: true
  end
end

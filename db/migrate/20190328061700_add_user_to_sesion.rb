class AddUserToSesion < ActiveRecord::Migration[5.1]
  def change
    add_reference :sesions, :user, foreign_key: true
  end
end

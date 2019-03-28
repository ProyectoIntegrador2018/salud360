class AddUserToDiet < ActiveRecord::Migration[5.1]
  def change
    add_reference :dieta, :user, foreign_key: true
  end
end

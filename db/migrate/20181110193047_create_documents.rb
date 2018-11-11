class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|

      t.string :asset
      t.timestamps
    end
  end
end

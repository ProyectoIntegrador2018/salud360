class AddDetailsToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_column :documents, :title, :string
    add_column :documents, :description, :string
  end
end

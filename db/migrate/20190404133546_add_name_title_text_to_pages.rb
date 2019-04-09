class AddNameTitleTextToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :name, :string
    add_column :pages, :title, :string
    add_column :pages, :text, :string
  end
end

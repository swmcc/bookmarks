class RenameUrlToPageInLinks < ActiveRecord::Migration[6.0]
  def change
    rename_column :links, :url, :page
  end
end

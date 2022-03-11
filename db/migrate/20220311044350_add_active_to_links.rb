class AddActiveToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :active, :boolean
  end
end

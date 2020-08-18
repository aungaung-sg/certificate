class AddThemeIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :theme_id, :integer
  end
end

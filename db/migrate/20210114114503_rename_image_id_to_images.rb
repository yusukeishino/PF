class RenameImageIdToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :image_id, :hobby_id
  end
end

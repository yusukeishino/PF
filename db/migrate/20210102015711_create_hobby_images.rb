class CreateHobbyImages < ActiveRecord::Migration[5.2]
  def change
    create_table :hobby_images do |t|
      t.string :image_id
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
